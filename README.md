# iOS Sample App for axe DevTools Mobile by Deque

A sample application built solely to showcase axe DevTools Mobile implementation. It is non-functional and made inaccessibly by design.

Get started with a [free trial today](https://axe.dequelabs.com/signup?product=axe-devtools-mobile&redirect_uri=https://axe.dequelabs.com/axe-devtools-mobile/get-started).

## Helpful Links
- Library documentation can be found at [docs.deque.com](https://docs.deque.com/devtools-mobile/).
- Learn more about [Deque and axe DevTools Mobile here](https://www.deque.com/).

------

## Get Started:

> Prerequisites:
> - Xcode 14 +
> - Optional: If running locally on iPhone device, it'll need to have iOS 15+.

This project uses Swift Package Manager to pull in the frameworks from [axe-devtools-ios](https://github.com/dequelabs/axe-devtools-ios/).

### For Manual Testing

1. To manually test this app, use [Deque's Mobile Analyzer](https://docs.deque.com/devtools-mobile-analyzer).

### For Automated Testing

1. Add your Deque API Key to `Login.swift`.

2. Once you have a device or simulator ready to go, open `SampleUITests.swift`, and tap on the diamond to run this suite. The simulator will launch, and the tests will run.

<img src="doc_img/UITests.png" alt="Shows the click area for running the UI test."/>

### For Automated Testing with Sauce Labs (Real Device Only)

_Note: XCUITests are only supported with a real device from Sauce at this time. This project requires a device on iOS 15.0 or later._

Follow our online guide for setting your project up with [XCUITesting on SauceLabs.](https://docs.deque.com/devtools-mobile/ios-example-sauce-labs-xcui) 

To run a test with this project, follow the prerequisites in the link above, then come back here.

Assuming you have already downloaded the sample project to your computer:
1. Add your Deque API Key to `Login.swift`.
2. Open a Terminal window, enter `cd `, then drag and drop the `axe-devtools-ios-sample-app` from Finder into the Terminal window. Hit return/enter.
3. In the same window, type `sh prepareForSauce.sh`. Hit return/enter.

This script will build the app, and begin executing automated tests in your Sauce Labs environment.

## Have a Question? Found a bug?

[Reach out to us](https://docs.deque.com/devtools-mobile/help), we'd love to help!
