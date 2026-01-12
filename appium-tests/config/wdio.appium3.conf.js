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
        'appium:automationName': 'AxeXCUITest',
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
            },
            ...(process.env.APPIUM_HOME && {
                env: {
                    ...process.env,
                    APPIUM_HOME: process.env.APPIUM_HOME
                }
            })
        }]
    ],

    framework: 'mocha',
    reporters: [
        'spec',
        ['junit', {
            outputDir: './test-results',
            outputFileFormat: function(options) {
                return `junit-appium3-${options.cid}.xml`
            }
        }],
        ['mochawesome', {
            outputDir: './html-report/',
            outputFileFormat(options) {
                return `appium3-test-report-${options.cid}.json`
            },
            reportTitle: 'iOS Appium 3 Test Report',
            reportPageTitle: 'iOS Appium 3 Test Report',
            useOnAfterCommandForScreenshot: true
        }]
    ],

    mochaOpts: {
        ui: 'bdd',
        timeout: 180000  // 3 minutes for orientation testing
    },

    // =====
    // Hooks
    // =====
    before: function (capabilities, specs) {
        console.log('Running tests with Appium 3.x and @axe-devtools AxeXCUITest driver');
    }
};
