//
//  MostPopularArticleServiceTests.swift
//  NY_MostPopularArticleTests
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import XCTest
@testable import NY_MostPopularArticle

class MostPopularArticleServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMostPopularArtilce() {
        
        let expectation = self.expectation(description:  "Web Service Response Received")
        
        self.measure {
            MostPopularArticleService.getMostPopularArticles(completionHandler: { obj, err in
                expectation.fulfill()
            })
        }
        self.waitForExpectations(timeout: 30) { error in
            XCTAssertNil(error)
        }
    }

}
