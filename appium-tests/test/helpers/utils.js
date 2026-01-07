/**
 * Utility functions for Appium tests
 */

const { expect } = require('chai');

class Utils {
    /**
     * Wait for element to be displayed
     * @param {WebdriverIO.Element} element - Element to wait for
     * @param {number} timeout - Timeout in milliseconds
     */
    async waitForElement(element, timeout = 10000) {
        await element.waitForDisplayed({ timeout });
        return element;
    }

    /**
     * Tap on element with retry
     * @param {WebdriverIO.Element} element - Element to tap
     * @param {number} retries - Number of retries
     */
    async tapWithRetry(element, retries = 3) {
        for (let i = 0; i < retries; i++) {
            try {
                await element.waitForDisplayed({ timeout: 5000 });
                await element.click();
                return;
            } catch (error) {
                if (i === retries - 1) {
                    throw error;
                }
                await driver.pause(1000);
            }
        }
    }

    /**
     * Swipe down to refresh
     */
    async swipeDown() {
        const { height, width } = await driver.getWindowRect();
        await driver.touchAction([
            { action: 'press', x: width / 2, y: height * 0.2 },
            { action: 'wait', ms: 100 },
            { action: 'moveTo', x: width / 2, y: height * 0.8 },
            'release'
        ]);
    }

    /**
     * Swipe up
     */
    async swipeUp() {
        const { height, width } = await driver.getWindowRect();
        await driver.touchAction([
            { action: 'press', x: width / 2, y: height * 0.8 },
            { action: 'wait', ms: 100 },
            { action: 'moveTo', x: width / 2, y: height * 0.2 },
            'release'
        ]);
    }

    /**
     * Get app state
     * @returns {number} App state
     */
    async getAppState() {
        return await driver.execute('mobile: queryAppState', {
            bundleId: 'com.deque.axe-devtools-ios-sample-app'
        });
    }

    /**
     * Verify element is displayed
     * @param {WebdriverIO.Element} element - Element to verify
     * @param {string} elementName - Name of element for error message
     */
    async verifyElementDisplayed(element, elementName) {
        await element.waitForDisplayed({ timeout: 10000 });
        const isDisplayed = await element.isDisplayed();
        expect(isDisplayed).to.be.true;
        console.log(`✓ ${elementName} is displayed`);
    }

    /**
     * Take screenshot with name
     * @param {string} name - Screenshot name
     */
    async takeScreenshot(name) {
        const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
        const filename = `${name}-${timestamp}.png`;
        await driver.saveScreenshot(`./screenshots/${filename}`);
        console.log(`Screenshot saved: ${filename}`);
    }

    /**
     * Wait for a specific time
     * @param {number} ms - Milliseconds to wait
     */
    async wait(ms = 1000) {
        await driver.pause(ms);
    }

    /**
     * Run axe accessibility scan and send results to QA dashboard
     * @param {string} scanName - Name for the scan
     * @param {string[]} tags - Tags for the scan
     * @returns {Object} Scan result
     */
    async runAxeScan(scanName, tags = ['appium_webdriverio']) {
        const apiKey = process.env.ADT_APIKEY || process.env.ADT_DEV_APIKEY || '';

        if (!apiKey) {
            console.warn('⚠ ADT_APIKEY not set, skipping axe scan');
            return null;
        }

        const axeSettings = {
            apiKey: apiKey,
            axeServiceUrl: 'https://mobile-qa.dequelabs.com',
            scanName: scanName,
            tags: tags
        };

        try {
            console.log(`🔍 Running axe scan: ${scanName}`);
            const scanResult = await driver.executeScript('mobile: axeScan', [axeSettings]);

            if (scanResult && scanResult.axeError) {
                console.error(`❌ Axe scan failed: ${scanResult.axeError}`);
                throw new Error(`Axe scan failed: ${scanResult.axeError}`);
            }

            console.log(`✓ Axe scan completed: ${scanName}`);
            if (scanResult && scanResult.violations) {
                console.log(`  - Violations found: ${scanResult.violations.length}`);
            }

            return scanResult;
        } catch (error) {
            console.error(`❌ Error running axe scan: ${error.message}`);
            throw error;
        }
    }

    /**
     * Run axe scan for a specific screen after navigation
     * @param {string} screenName - Name of the screen
     * @param {string[]} tags - Additional tags
     */
    async scanScreen(screenName, tags = []) {
        // Wait for screen to stabilize
        await this.wait(1500);

        const scanTags = ['appium_webdriverio', 'ios', screenName.toLowerCase(), ...tags];
        const scanName = `${screenName} Screen Accessibility Scan`;

        return await this.runAxeScan(scanName, scanTags);
    }
}

module.exports = new Utils();
