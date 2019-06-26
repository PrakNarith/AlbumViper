//
//  WekViewTests.swift
//  AlbumViperTests
//
//  Created by Narith Prak on 6/26/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import XCTest
@testable import AlbumViper

class WekViewTests: XCTestCase {
  var presenter: MockWebViewToPresenter!
  var viewController: WebViewController!

  override func setUp() {
    super.setUp()

    presenter = MockWebViewToPresenter()
    viewController = WebViewController()
    viewController.output = presenter
  }

  override func tearDown() {
    presenter = nil
    viewController = nil

    super.tearDown()
  }

  func testThatControllerNotifiesPresenterOnDidLoad() {
    //When
    viewController.viewDidLoad()

    //Then
    XCTAssertTrue(presenter.viewIsReadyCalled)
  }

}

class MockWebViewToPresenter: WebViewToPresenterProtocol {
  var viewIsReadyCalled = false
  func viewIsReady() {
    viewIsReadyCalled = true
  }
}
