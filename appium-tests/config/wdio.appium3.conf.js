const path = require('path');

exports.config = {
    // ====================
    // Runner Configuration
    // ====================
    runner: 'local',
    port: 4723,

    // ==================
    // Specify Test Files
    // ==================
    specs: [
        path.join(__dirname, '../test/specs/**/*.js')
    ],

    // ============
    // Capabilities
    // ============
    maxInstances: 1,
    capabilities: [{
        platformName: 'iOS',
        'appium:platformVersion': process.env.IOS_VERSION || '17.5',
        'appium:deviceName': process.env.DEVICE_NAME || 'iPhone 15 Pro',
        'appium:automationName': 'XCUITest',
        'appium:app': process.env.APP_PATH || path.join(__dirname, '../../build/Release-iphonesimulator/axe-devtools-ios-sample-app.app'),
        'appium:noReset': false,
        'appium:fullReset': false,
        'appium:newCommandTimeout': 240,
        'appium:wdaLaunchTimeout': 180000
    }],

    // ===================
    // Test Configurations
    // ===================
    logLevel: 'info',
    bail: 0,
    baseUrl: '',
    waitforTimeout: 30000,
    connectionRetryTimeout: 120000,
    connectionRetryCount: 3,
    autoCompileOpts: {
        autoCompile: false
    },

    services: [
        ['appium', {
            command: 'appium',
            args: {
                relaxedSecurity: true,
                log: './appium.log',
                address: '127.0.0.1',
                port: 4723
            }
        }]
    ],

    framework: 'mocha',
    reporters: ['spec'],

    mochaOpts: {
        ui: 'bdd',
        timeout: 60000
    },

    // =====
    // Hooks
    // =====
    before: function (capabilities, specs) {
        console.log('Running tests with Appium 3.x and XCUITest driver');
    }
};
