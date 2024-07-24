import XCTest

final class ImageFeedUITests: XCTestCase {
    private let app = XCUIApplication()
    private let login = " "
    private let email = " "
    private let password = " "
    private let username = " "

    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["testMode"]
        app.launch()
    }

    func testAuth() throws {
        //sleep(5)
        app.buttons["Authenticate"].tap()
        
        let webView = app.webViews["UnsplashWebView"]
        XCTAssertTrue(webView.waitForExistence(timeout: 5))
        
        let loginTextField = webView.descendants(matching: .textField).element
        XCTAssertTrue(loginTextField.waitForExistence(timeout: 5))
        loginTextField.tap()
        loginTextField.typeText(email)
        loginTextField.swipeUp()
        
        let passwordTextField = webView.descendants(matching: .secureTextField).element
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 5))
        
        app.buttons["Done"].tap()
        passwordTextField.tap()
        passwordTextField.typeText(password)
        sleep(2)
        passwordTextField.swipeUp()
        sleep(1)
        app.buttons["Done"].tap()
        webView.buttons["Login"].tap()
        
        let tablesQuery = app.tables
        let cell = tablesQuery.children(matching: .cell).element(boundBy: 0)
        XCTAssertTrue(cell.waitForExistence(timeout: 5))
        
    }
    
    func testFeed() throws {
        let tablesQuery = app.tables
        
        let cell = tablesQuery.children(matching: .cell).element(boundBy: 0)
        cell.swipeUp()
        sleep(2)
        
        let cellToLike = tablesQuery.descendants(matching: .cell).element(boundBy: 1)
       
        cellToLike.buttons["Like button"].tap()
        sleep(2)
        cellToLike.buttons["Like button"].tap()
        sleep(2)
        
        cellToLike.tap()
        sleep(6)
        
        let image = app.scrollViews.images.element(boundBy: 0)
        image.pinch(withScale: 3, velocity: 1)
        image.pinch(withScale: 0.5, velocity: -1)
        
        app.buttons["Back"].tap()
    }
    
    func testProfile() throws {
       sleep(2)
        app.tabBars.buttons.images["tab_profile_active"].tap()
        sleep(2)
        
        XCTAssertTrue(app.staticTexts[login].exists)
        XCTAssertTrue(app.staticTexts[username].exists)
        
        app.buttons["Logout"].tap()
        sleep(2)
        
        app.alerts["Пока, пока!"].scrollViews.otherElements.buttons["Да"].tap()
        sleep(3)
        
        XCTAssertTrue(app.buttons["Authenticate"].exists)
        
    }
}


