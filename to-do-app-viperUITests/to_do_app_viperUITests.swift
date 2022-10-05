//
//  to_do_app_viperUITests.swift
//  to-do-app-viperUITests
//
//  Created by Tolga Kağan Aysu on 5.10.2022.
//

import XCTest

final class to_do_app_viperUITests: XCTestCase {


    func testToDoItem() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let addButton = app.navigationBars["Notes"].buttons["Add"]
        let textField = app.textFields["Add Note"]
        let createButton = app/*@START_MENU_TOKEN@*/.staticTexts["Create"]/*[[".buttons[\"Create\"].staticTexts[\"Create\"]",".staticTexts[\"Create\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let addCell = app.tables.cells.containing(.staticText, identifier: "Tolga Kağan").element
        
        addButton.tap()
        textField.tap()
        textField.typeText("Tolga Kağan")
        createButton.tap()
        
        XCTAssertTrue(addCell.exists)
        
                
          
    }
    
    func testDeleteFunction() throws {
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.navigationBars["Notes"].buttons["Add"]
        let textField = app.textFields["Add Note"]
        let createButton = app/*@START_MENU_TOKEN@*/.staticTexts["Create"]/*[[".buttons[\"Create\"].staticTexts[\"Create\"]",".staticTexts[\"Create\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let addCell = app.tables.cells.containing(.staticText, identifier: "Tolga Kağan").element
        
        addButton.tap()
        textField.tap()
        textField.typeText("Tolga Kağan")
        createButton.tap()
        
        
        addCell.swipeLeft()
        let deleteButton = app.tables.buttons["Delete"]
        deleteButton.tap()
        let deleteButtonAlert = app.alerts.buttons["Delete"]
        deleteButtonAlert.tap()
        
        
        XCTAssertFalse(addCell.exists)
        
                        
        
               
                
    }

    
}


