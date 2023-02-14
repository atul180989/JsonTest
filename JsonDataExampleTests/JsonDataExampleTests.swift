//
//  JsonDataExampleTests.swift
//  JsonDataExampleTests
//
//  Created by Atul Bhaisare on 2/9/23.
//

import XCTest
@testable import JsonDataExample
final class JsonDataExampleTests: XCTestCase {

    var viewModel: UserViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UserViewModel()
//        viewModel.usersArray = [UserModel(name: "Atul", address: Address(city: "Washington D.C"))]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUser() throws {
        XCTAssertEqual(viewModel.usersArray.count, 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
