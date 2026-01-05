const { expect } = require('chai');
const utils = require('../helpers/utils');
const selectors = require('../helpers/selectors');

describe('App Launch Tests', () => {
    it('should launch the app successfully', async () => {
        // Wait for app to load
        await utils.wait(2000);

        // Verify app is in foreground
        const appState = await utils.getAppState();
        expect(appState).to.equal(4); // 4 = running in foreground

        console.log('✓ App launched successfully');
    });

    it('should display the tab bar with all tabs', async () => {
        // Find tab bar
        const tabBar = await $(selectors.tabBar);
        await utils.verifyElementDisplayed(tabBar, 'Tab Bar');

        // Verify all tabs are present
        const homeTab = await $(selectors.homeTab);
        const catalogTab = await $(selectors.catalogTab);
        const cartTab = await $(selectors.cartTab);
        const profileTab = await $(selectors.profileTab);

        await utils.verifyElementDisplayed(homeTab, 'Home Tab');
        await utils.verifyElementDisplayed(catalogTab, 'Catalog Tab');
        await utils.verifyElementDisplayed(cartTab, 'Cart Tab');
        await utils.verifyElementDisplayed(profileTab, 'Profile Tab');
    });

    it('should display Home screen by default', async () => {
        // Verify Home header is displayed
        const homeHeader = await $(`-ios predicate string:${selectors.homeHeader}`);
        await utils.verifyElementDisplayed(homeHeader, 'Home Header');
    });
});
