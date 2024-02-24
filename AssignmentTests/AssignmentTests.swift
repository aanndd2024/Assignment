//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by Anand Yadav on 20-02-2024.
//

import XCTest
@testable import Assignment

final class AssignmentTests: XCTestCase {
    var viewModel : ArticleViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ArticleViewModel()
    }
    
    override func tearDown() {
        self.viewModel = nil
        super.tearDown()
    }
    
    func testFetchArticle() async throws {
        await viewModel.fetchArticles()
        XCTAssertNotNil(viewModel.articles)
    }

}
