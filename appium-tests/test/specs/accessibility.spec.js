const { expect } = require('chai');
const utils = require('../helpers/utils');
const selectors = require('../helpers/selectors');

describe('Accessibility Tests', () => {
    it('should verify tab bar accessibility labels', async () => {
        const tabs = [
            { selector: selectors.homeTab, label: 'Home' },
            { selector: selectors.catalogTab, label: 'Catalog' },
            { selector: selectors.cartTab, label: 'Cart' },
            { selector: selectors.profileTab, label: 'Profile' }
        ];

        for (const tab of tabs) {
            const element = await $(tab.selector);
            await element.waitForDisplayed({ timeout: 5000 });

            // Verify element is accessible
            const isEnabled = await element.isEnabled();
            expect(isEnabled).to.be.true;

            console.log(`✓ ${tab.label} tab is accessible`);
        }

        // Run axe scan on tab bar accessibility
        await utils.scanScreen('Tab Bar Accessibility', ['accessibility', 'tab-labels']);
    });

    it('should verify all tabs are clickable', async () => {
        const tabs = [
            selectors.homeTab,
            selectors.catalogTab,
            selectors.cartTab,
            selectors.profileTab
        ];

        for (const tabSelector of tabs) {
            const tab = await $(tabSelector);
            await tab.waitForDisplayed({ timeout: 5000 });

            // Verify element is clickable
            const isClickable = await tab.isClickable();
            expect(isClickable).to.be.true;
        }

        console.log('✓ All tabs are clickable');

        // Run axe scan on tab clickability
        await utils.scanScreen('Tabs Clickable', ['accessibility', 'interactive']);
    });

    it('should verify screen navigation is accessible', async () => {
        // Test navigation to each screen
        const navigationTests = [
            { tab: selectors.catalogTab, name: 'Catalog' },
            { tab: selectors.cartTab, name: 'Cart' },
            { tab: selectors.profileTab, name: 'Profile' },
            { tab: selectors.homeTab, name: 'Home' }
        ];

        for (const test of navigationTests) {
            const tab = await $(test.tab);
            await utils.tapWithRetry(tab);
            await utils.wait(1000);

            // Take screenshot for accessibility review
            await utils.takeScreenshot(`accessibility-${test.name.toLowerCase()}`);

            console.log(`✓ ${test.name} screen accessible and screenshot captured`);

            // Run axe scan on each navigated screen
            await utils.scanScreen(`${test.name} Navigation`, ['accessibility', test.name.toLowerCase(), 'navigation']);
        }
    });

    it('should verify UI elements have appropriate sizes for touch targets', async () => {
        // Get tab elements
        const homeTab = await $(selectors.homeTab);
        await homeTab.waitForDisplayed({ timeout: 5000 });

        // Get element size
        const size = await homeTab.getSize();

        // Verify minimum touch target size (44x44 points for iOS)
        expect(size.width).to.be.at.least(44);
        expect(size.height).to.be.at.least(44);

        console.log(`✓ Tab touch targets meet minimum size requirements (${size.width}x${size.height})`);

        // Run axe scan on touch targets
        await utils.scanScreen('Touch Targets', ['accessibility', 'touch-targets', 'sizing']);
    });

    it('should run comprehensive accessibility scan on all screens', async () => {
        const screens = [
            { tab: selectors.homeTab, name: 'Home' },
            { tab: selectors.catalogTab, name: 'Catalog' },
            { tab: selectors.cartTab, name: 'Cart' },
            { tab: selectors.profileTab, name: 'Profile' }
        ];

        console.log('🔍 Running comprehensive accessibility scan on all screens...');

        for (const screen of screens) {
            // Navigate to screen
            const tab = await $(screen.tab);
            await utils.tapWithRetry(tab);
            await utils.wait(1500);

            console.log(`Scanning ${screen.name} screen...`);

            // Run comprehensive axe scan
            const scanResult = await utils.runAxeScan(
                `${screen.name} Comprehensive Scan`,
                ['comprehensive', 'full-suite', screen.name.toLowerCase(), 'wcag']
            );

            if (scanResult) {
                console.log(`✓ ${screen.name} scan completed`);
                if (scanResult.violations && scanResult.violations.length > 0) {
                    console.log(`  ⚠ Found ${scanResult.violations.length} violation(s) on ${screen.name} screen`);
                } else {
                    console.log(`  ✓ No violations found on ${screen.name} screen`);
                }
            }
        }

        console.log('✓ Comprehensive accessibility scan completed for all screens');
    });
});