# Appium Tests for axe DevTools iOS Sample App

Automated UI tests for the axe DevTools iOS Sample App using Appium with WebDriverIO.

## Prerequisites

- Node.js 18+
- Xcode 15+
- macOS for running iOS Simulator
- iOS app built for simulator

## Project Structure

```
appium-tests/
├── config/
│   ├── wdio.appium2.conf.js    # Configuration for Appium 2.x
│   └── wdio.appium3.conf.js    # Configuration for Appium 3.x
├── test/
│   ├── helpers/
│   │   ├── selectors.js         # Element selectors
│   │   └── utils.js             # Utility functions
│   └── specs/
│       ├── app-launch.spec.js   # App launch tests
│       ├── tab-navigation.spec.js # Tab navigation tests
│       ├── home-screen.spec.js  # Home screen tests
│       └── accessibility.spec.js # Accessibility tests
├── package.json
└── README.md
```

## Installation

1. Install dependencies:
```bash
cd appium-tests
npm install
```

2. Install Appium globally (choose version):

**For Appium 2.x:**
```bash
npm install -g appium@2
```

**For Appium 3.x:**
```bash
npm install -g appium@next
```

3. Configure npm for @axe-devtools registry:

```bash
npm config set "@deque:registry" "https://agora.dequecloud.com/artifactory/api/npm/dequelabs/"
npm config set "@axe-devtools:registry" "https://agora.dequecloud.com/artifactory/api/npm/dequelabs/"
npm config set "//agora.dequecloud.com/artifactory/api/npm/dequelabs/:email" "your-email@example.com"
npm config set "//agora.dequecloud.com/artifactory/api/npm/dequelabs/:_authToken" "your-auth-token"
```

4. Install @axe-devtools XCUITest driver:

**For Appium 2.x:**
```bash
appium driver install --source=npm @axe-devtools/axe-appium-xcuitest-driver@2.2.0
```

**For Appium 3.x:**
```bash
appium driver install --source=npm @axe-devtools/axe-appium3-xcuitest-driver@1.1.0
```

5. Verify installation:
```bash
appium driver list
```

## Build the iOS App

Before running tests, build the app for iOS Simulator:

```bash
cd ..
xcodebuild \
  -project axe-devtools-ios-sample-app.xcodeproj \
  -scheme axe-devtools-ios-sample-app \
  -sdk iphonesimulator \
  -configuration Release \
  -derivedDataPath ./DerivedData \
  CODE_SIGNING_ALLOWED=NO \
  CODE_SIGNING_REQUIRED=NO \
  build
```

The built app will be located at:
```
./DerivedData/Build/Products/Release-iphonesimulator/axe-devtools-ios-sample-app.app
```

## Running Tests

### Run with Appium 2.x:
```bash
npm run test:appium2
```

### Run with Appium 3.x:
```bash
npm run test:appium3
```

### Run default tests (Appium 3):
```bash
npm test
```

## Axe Accessibility Scanning

The tests include automated axe accessibility scanning that sends results to the QA dashboard.

### Setup for Axe Scans

1. **Set API Key** (required for scans to run):
```bash
export ADT_APIKEY="your-api-key-here"
# OR for dev environment
export ADT_DEV_APIKEY="your-dev-api-key"
```

2. **Run tests** - axe scans will run automatically during tests:
```bash
npm test
```

### Axe Scan Features

- **Automatic scanning** on every screen navigation
- **Results sent to QA Dashboard** at `https://mobile-qa.dequelabs.com`
- **Tagged scans** for easy filtering:
  - Screen names (home, catalog, cart, profile)
  - Test types (navigation, accessibility, etc.)
  - Platform (ios, appium_webdriverio)

### Viewing Scan Results

1. Go to https://mobile-qa.dequelabs.com
2. Log in with your credentials
3. View scans filtered by:
   - Scan name (e.g., "Home Screen Accessibility Scan")
   - Tags (e.g., "home", "catalog", "accessibility")
   - Date/time

### Scan Coverage

The tests scan accessibility for:
- **App Launch**: Initial app state
- **Tab Navigation**: All tab screens (Home, Catalog, Cart, Profile)
- **Home Screen**: Main view, search bar, scrolled content, navigation bar
- **Comprehensive Suite**: Full WCAG compliance checks on all screens

## Configuration Options

You can customize test execution using environment variables:

```bash
# Set iOS version
export IOS_VERSION="17.0"

# Set device name
export DEVICE_NAME="iPhone 15 Pro"

# Set custom app path
export APP_PATH="/path/to/your/app.app"

# Run tests
npm run test:appium3
```

## Test Suites

### 1. App Launch Tests (`app-launch.spec.js`)
- Verifies app launches successfully
- Checks tab bar displays all tabs
- Validates Home screen loads by default

### 2. Tab Navigation Tests (`tab-navigation.spec.js`)
- Tests navigation between all tabs (Home, Catalog, Cart, Profile)
- Verifies tab state is maintained
- Validates screen transitions

### 3. Home Screen Tests (`home-screen.spec.js`)
- Tests Home screen element visibility
- Validates search bar display
- Tests scrolling functionality

### 4. Accessibility Tests (`accessibility.spec.js`)
- Verifies accessibility labels for all tabs
- Tests clickability of UI elements
- Validates touch target sizes
- Captures screenshots for accessibility review

## GitHub Actions Workflow

The project includes a GitHub Actions workflow (`.github/workflows/ios-appium-tests.yml`) that:

1. **Builds the iOS app** for simulator
2. **Tests with Appium 2.x** using @axe-devtools driver version:
   - 2.2.0
3. **Tests with Appium 3.x** using @axe-devtools driver version:
   - 1.1.0

### Triggering the Workflow

The workflow runs automatically on:
- Push to `main`, `master`, or `develop` branches
- Pull requests to these branches

You can also manually trigger it:
1. Go to Actions tab in GitHub
2. Select "iOS Appium Tests" workflow
3. Click "Run workflow"
4. Optionally specify iOS version and device name

### Workflow Outputs

- Test results uploaded as artifacts
- Screenshots for each test run
- Appium logs for debugging
- Summary of test execution

## Troubleshooting

### Simulator doesn't boot
```bash
# List all simulators
xcrun simctl list devices

# Boot specific simulator
xcrun simctl boot <SIMULATOR_ID>

# Reset simulator if needed
xcrun simctl erase <SIMULATOR_ID>
```

### App not found
- Verify the app path in the config file
- Ensure the app is built for the correct simulator architecture
- Check that APP_PATH environment variable is set correctly

### @axe-devtools XCUITest driver issues
```bash
# Reinstall driver for Appium 2
appium driver uninstall axexcuitest
appium driver install --source=npm @axe-devtools/axe-appium-xcuitest-driver@<VERSION>

# Reinstall driver for Appium 3
appium driver uninstall axexcuitest
appium driver install --source=npm @axe-devtools/axe-appium3-xcuitest-driver@<VERSION>

# Check driver status
appium driver list
```

### Port already in use
If port 4723 is already in use:
```bash
# Find process using port
lsof -ti:4723

# Kill the process
kill -9 <PID>
```

## Test Reports

Test results are displayed in the console with:
- Pass/fail status for each test
- Execution time
- Detailed error messages for failures

Screenshots are automatically captured for accessibility tests and saved to `./screenshots/`.

## @axe-devtools XCUITest Driver Version Compatibility

### Appium 2.x
- Uses @axe-devtools/axe-appium-xcuitest-driver
- Supported versions: 2.x, 3.x
- Recommended: 2.2.0 

### Appium 3.x
- Uses @axe-devtools/axe-appium3-xcuitest-driver
- Supported versions: 1.x, 3.x
- Recommended: 1.1.0

## Additional Resources

- [Appium Documentation](https://appium.io/docs/en/latest/)
- [WebDriverIO Documentation](https://webdriver.io/)
- [XCUITest Driver Documentation](https://appium.github.io/appium-xcuitest-driver/)
- [axe DevTools Mobile Documentation](https://docs.deque.com/devtools-mobile/)

## Contributing

When adding new tests:
1. Follow existing test structure
2. Use helper functions from `utils.js`
3. Add selectors to `selectors.js`
4. Include descriptive test names and console logs
5. Add screenshots for visual validation when needed

## License

Same as the main project.
