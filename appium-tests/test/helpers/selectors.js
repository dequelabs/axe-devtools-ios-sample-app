/**
 * Selectors for axe DevTools iOS Sample App
 * Using XCUITest accessibility identifiers and predicates
 */

module.exports = {
    // Tab Bar
    tabBar: '~Tab Bar',
    homeTab: '~Home',
    catalogTab: '~Catalog',
    cartTab: '~Cart',
    profileTab: '~Profile',

    // Home Screen Elements
    homeSearchBar: 'type == "XCUIElementTypeSearchField"',
    homeHeader: 'label == "Home"',

    // Catalog Screen Elements
    catalogHeader: 'label == "Catalog"',

    // Cart Screen Elements
    cartHeader: 'label == "Cart"',

    // Profile Screen Elements
    profileHeader: 'label == "Profile"',

    // Generic Elements
    navigationBar: 'type == "XCUIElementTypeNavigationBar"',
    backButton: 'type == "XCUIElementTypeButton" AND label == "Back"',

    // Helper function to create custom selector
    customSelector: (predicate) => `-ios predicate string:${predicate}`
};
