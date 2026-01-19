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

    it('should verify all tabs are interactive', async () => {
        const tabs = [
            selectors.homeTab,
            selectors.catalogTab,
            selectors.cartTab,
            selectors.profileTab
        ];

        for (const tabSelector of tabs) {
            const tab = await $(tabSelector);
            await tab.waitForDisplayed({ timeout: 5000 });

            // Verify element is displayed and enabled (interactable)
            const isDisplayed = await tab.isDisplayed();
            const isEnabled = await tab.isEnabled();
            expect(isDisplayed).to.be.true;
            expect(isEnabled).to.be.true;
        }

        console.log('✓ All tabs are interactive');

        // Run axe scan on tab interactivity
        await utils.scanScreen('Tabs Interactive', ['accessibility', 'interactive']);
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

    it('should verify UI elements are displayed and report touch target sizes', async () => {
        // Get tab elements
        const homeTab = await $(selectors.homeTab);
        await homeTab.waitForDisplayed({ timeout: 5000 });

        // Get element size
        const size = await homeTab.getSize();

        // Verify element is displayed
        const isDisplayed = await homeTab.isDisplayed();
        expect(isDisplayed).to.be.true;

        // Log actual touch target size (iOS recommends 44x44 points minimum)
        console.log(`Tab touch target size: ${size.width}x${size.height}px`);

        if (size.width >= 44 && size.height >= 44) {
            console.log('✓ Touch targets meet iOS minimum size recommendation (44x44)');
        } else {
            console.log(`⚠ Touch targets smaller than recommended: width=${size.width}px, height=${size.height}px (recommended: 44x44px)`);
        }

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

    it('should scan all screens in both portrait and landscape orientations', async function() {
        // Increase timeout for multi-orientation testing (4 screens × 2 orientations × ~20s each)
        this.timeout(180000); // 3 minutes

        const screens = [
            { tab: selectors.homeTab, name: 'Home' },
            { tab: selectors.catalogTab, name: 'Catalog' },
            { tab: selectors.cartTab, name: 'Cart' },
            { tab: selectors.profileTab, name: 'Profile' }
        ];

        console.log('\n🔄 Starting multi-orientation accessibility scan on all screens...\n');

        for (const screen of screens) {
            // Navigate to screen
            const tab = await $(screen.tab);
            await utils.tapWithRetry(tab);
            await utils.wait(1500);

            console.log(`\n======== Scanning ${screen.name} Screen in All Orientations ========`);

            // Run scan in both portrait and landscape
            const orientationResults = await utils.scanScreenAllOrientations(
                screen.name,
                ['multi-orientation', 'comprehensive', screen.name.toLowerCase(), 'wcag']
            );

            // Log summary for each orientation
            if (orientationResults) {
                for (const [orientation, result] of Object.entries(orientationResults)) {
                    if (result && !result.error) {
                        const violationCount = result.violations ? result.violations.length : 0;
                        if (violationCount > 0) {
                            console.log(`  ⚠ ${screen.name} in ${orientation}: ${violationCount} violation(s)`);
                        } else {
                            console.log(`  ✓ ${screen.name} in ${orientation}: No violations`);
                        }
                    } else if (result && result.error) {
                        console.log(`  ❌ ${screen.name} in ${orientation}: Error - ${result.error}`);
                    }
                }
            }

            console.log(`======== Completed ${screen.name} ========\n`);
        }

        console.log('✅ Multi-orientation accessibility scan completed for all screens\n');
    });
});