# iOS Sample App for axe DevTools Mobile by Deque

A sample application built solely to showcase axe DevTools Mobile implementation. It is non-functional and made inaccessibly by design.

<!-- Get started with a [free trial today](https://axe.dequelabs.com/signup?product=axe-devtools-mobile&redirect_uri=https://axe.dequelabs.com/axe-devtools-mobile/get-started).-->

## Helpful Links
- Library documentation and more information on automated or manual testing can be found at [docs.deque.com](https://docs.deque.com/devtools-mobile/).
- Learn more about [Deque and axe DevTools Mobile here](https://www.deque.com/).

------

## Get Started:

> Prerequisites:
> - Xcode 15 +
> - Optional: If running locally on iPhone device, it'll need to have iOS 16+.

This project uses Swift Package Manager to pull in the frameworks from [axe-devtools-ios](https://github.com/dequelabs/axe-devtools-ios/).

1. Add your Deque API Key and your Deque Project Id to `Login.swift`.

2. Once you have a device or simulator ready to go, open `SampleUITests.swift`, and tap on the diamond to run this suite. The simulator will launch, and the tests will run.

<img src="doc_img/UITests.png" alt="Shows the click area for running the UI test."/>

### For Automated Testing with Sauce Labs

_Note: This project requires a device on iOS 16.0 or later. Additionally, Virtual Devices running iOS 17.0 may experience hanging during testing. Use an iOS 16.2 Virtual Device to see a successful test run._

To run a test with this project, or to setup your own project, follow our online guide to get started with [XCUITesting on SauceLabs.](https://docs.deque.com/devtools-mobile/ios-example-sauce-labs-xcui)

Assuming you have already downloaded the sample project to your computer:
1. Add your Deque API Key and your Deque Project Id to `Login.swift`.
2. Open a Terminal window, enter `cd `, then drag and drop the `axe-devtools-ios-sample-app` from Finder into the Terminal window. Hit return/enter.

To run on **Real Devices**, type `sh prepareForSauceRealDevice.sh` in the same window. Hit return/enter.

To run on **Virtual Devices**, type `sh prepareForSauceVirtualDevice.sh` in the same window. Hit return/enter.

These scripts will build the app for the appropriate device type and begin executing automated tests in your Sauce Labs environment.

## Have a Question? Found a bug?

[Reach out to us](https://docs.deque.com/devtools-mobile/help), we'd love to help!
