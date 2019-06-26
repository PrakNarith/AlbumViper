//
//  AlbumViewControllerTests.swift
//  AlbumViperTests
//
//  Created by Narith Prak on 6/25/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import XCTest
@testable
import AlbumViper

class AlbumViewControllerTests: XCTestCase {
  var controller: AlbumViewController!
  var presenter: MockViewToPresenter!

  override func setUp() {
    super.setUp()
    controller = AlbumViewController()
    presenter = MockViewToPresenter()
    controller.presenter = presenter
  }

  override func tearDown() {
    controller = nil
    presenter = nil
    super.tearDown()
  }

  func testThatControllerNotifiesPresenterOnDidLoad() {
    //When
    controller.viewDidLoad()

    //Then
    XCTAssertTrue(presenter.didTriggerViewReadyCalled)
  }
}

class MockViewToPresenter: AlbumViewToPresentProtocol  {
  var didTriggerViewReadyCalled = false
  func didTriggerViewReady() {
    didTriggerViewReadyCalled = true
  }

  var showBuyAlbumCalled = false
  func showBuyAlbum(on navController: UINavigationController, data: Any) {
    showBuyAlbumCalled = true
  }


}
