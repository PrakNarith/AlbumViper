//
//  WebViewBuilderTests.swift
//  AlbumViperTests
//
//  Created by Narith Prak on 6/26/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import XCTest
@testable import AlbumViper

class WebViewBuilderTests: XCTestCase {

  func testBuilder() {
    //Given
    let viewController = WebViewBuilder.build(with: [])

    //Then
    XCTAssertNotNil(viewController.output)
    XCTAssertTrue(viewController.output is WebViewPresenter)

    let presenter: WebViewPresenter = viewController.output as! WebViewPresenter
    XCTAssertNotNil(presenter.view)
  }
}
