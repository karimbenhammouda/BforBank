//
//  BforBankUITests.swift
//  BforBankUITests
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import XCTest

final class BforBankUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        let app = XCUIApplication()
        app.launch()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testScreenAccountText() throws {
        let app = XCUIApplication()
        XCTAssert(app.staticTexts["Account Screen"].exists)
    }
    
    func testNavigationToVirementView() {
        let app = XCUIApplication()
        app.launch()
        
        let tabBarsQuery = XCUIApplication().tabBars
        tabBarsQuery.buttons["Virements"].tap()

        XCTAssert(app.staticTexts["Scannez, importez ou saisissez l’IBAN"].exists)
    }
}

