const { expect } = require('chai');
const utils = require('../helpers/utils');
const selectors = require('../helpers/selectors');

describe('Tab Navigation Tests', () => {
    beforeEach(async () => {
        // Ensure we start on Home tab
        const homeTab = await $(selectors.homeTab);
        await utils.tapWithRetry(homeTab);
        await utils.wait(1000);
    });

    it('should navigate to Catalog tab', async () => {
        // Tap on Catalog tab
        const catalogTab = await $(selectors.catalogTab);
        await utils.tapWithRetry(catalogTab);
        await utils.wait(1000);

        // Verify Catalog screen is displayed
        const catalogHeader = await $(`-ios predicate string:${selectors.catalogHeader}`);
        await utils.verifyElementDisplayed(catalogHeader, 'Catalog Header');

        console.log('✓ Successfully navigated to Catalog tab');
    });

    it('should navigate to Cart tab', async () => {
        // Tap on Cart tab
        const cartTab = await $(selectors.cartTab);
        await utils.tapWithRetry(cartTab);
        await utils.wait(1000);

        // Verify Cart screen is displayed
        const cartHeader = await $(`-ios predicate string:${selectors.cartHeader}`);
        await utils.verifyElementDisplayed(cartHeader, 'Cart Header');

        console.log('✓ Successfully navigated to Cart tab');
    });

    it('should navigate to Profile tab', async () => {
        // Tap on Profile tab
        const profileTab = await $(selectors.profileTab);
        await utils.tapWithRetry(profileTab);
        await utils.wait(1000);

        // Verify Profile screen is displayed
        const profileHeader = await $(`-ios predicate string:${selectors.profileHeader}`);
        await utils.verifyElementDisplayed(profileHeader, 'Profile Header');

        console.log('✓ Successfully navigated to Profile tab');
    });

    it('should navigate between all tabs', async () => {
        const tabs = [
            { selector: selectors.catalogTab, header: selectors.catalogHeader, name: 'Catalog' },
            { selector: selectors.cartTab, header: selectors.cartHeader, name: 'Cart' },
            { selector: selectors.profileTab, header: selectors.profileHeader, name: 'Profile' },
            { selector: selectors.homeTab, header: selectors.homeHeader, name: 'Home' }
        ];

        for (const tab of tabs) {
            // Tap on tab
            const tabElement = await $(tab.selector);
            await utils.tapWithRetry(tabElement);
            await utils.wait(1000);

            // Verify screen is displayed
            const header = await $(`-ios predicate string:${tab.header}`);
            await utils.verifyElementDisplayed(header, `${tab.name} Header`);

            console.log(`✓ Successfully navigated to ${tab.name} tab`);
        }
    });

    it('should maintain tab state when switching between tabs', async () => {
        // Navigate to Catalog
        const catalogTab = await $(selectors.catalogTab);
        await utils.tapWithRetry(catalogTab);
        await utils.wait(1000);

        // Navigate away and back
        const homeTab = await $(selectors.homeTab);
        await utils.tapWithRetry(homeTab);
        await utils.wait(500);

        await utils.tapWithRetry(catalogTab);
        await utils.wait(1000);

        // Verify Catalog is still displayed
        const catalogHeader = await $(`-ios predicate string:${selectors.catalogHeader}`);
        await utils.verifyElementDisplayed(catalogHeader, 'Catalog Header');

        console.log('✓ Tab state maintained successfully');
    });
});
