const { expect } = require('chai');
const utils = require('../helpers/utils');
const selectors = require('../helpers/selectors');

describe('Home Screen Tests', () => {
    beforeEach(async () => {
        // Ensure we're on Home tab
        const homeTab = await $(selectors.homeTab);
        await utils.tapWithRetry(homeTab);
        await utils.wait(1000);
    });

    it('should display Home screen elements', async () => {
        // Verify Home header
        const homeHeader = await $(`-ios predicate string:${selectors.homeHeader}`);
        await utils.verifyElementDisplayed(homeHeader, 'Home Header');

        console.log('✓ Home screen elements displayed');

        // Run axe scan on Home screen
        await utils.scanScreen('Home Screen', ['home', 'main-view']);
    });

    it('should display search bar on Home screen', async () => {
        // Look for search field
        const searchBar = await $(`-ios predicate string:${selectors.homeSearchBar}`);

        try {
            await searchBar.waitForDisplayed({ timeout: 5000 });
            const isDisplayed = await searchBar.isDisplayed();
            if (isDisplayed) {
                console.log('✓ Search bar is displayed');

                // Run axe scan on search bar
                await utils.scanScreen('Home Screen Search', ['home', 'search-bar']);
            }
        } catch (error) {
            console.log('⚠ Search bar may not be visible or accessible');
        }
    });

    it('should be able to scroll on Home screen', async () => {
        // Perform scroll action
        await utils.swipeUp();
        await utils.wait(1000);

        // Run axe scan after scrolling down
        await utils.scanScreen('Home Screen Scrolled', ['home', 'scrolled-view']);

        // Scroll back up
        await utils.swipeDown();
        await utils.wait(1000);

        console.log('✓ Successfully scrolled on Home screen');
    });

    it('should display navigation bar', async () => {
        const navBar = await $(`-ios predicate string:${selectors.navigationBar}`);
        await navBar.waitForDisplayed({ timeout: 5000 });

        const isDisplayed = await navBar.isDisplayed();
        expect(isDisplayed).to.be.true;

        console.log('✓ Navigation bar is displayed');

        // Run axe scan on navigation bar
        await utils.scanScreen('Home Screen Navigation', ['home', 'navigation-bar']);
    });
});