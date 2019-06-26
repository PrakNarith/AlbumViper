//
//  AlbumPresenterTests.swift
//  AlbumViperTests
//
//  Created by Narith Prak on 6/25/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import XCTest
@testable import AlbumViper

class AlbumPresenterTests: XCTestCase {
  var presenter: AlbumPresenter!
  var mockInteractor: MockPresenterToInteractor!
  var mockRouter: MockRouter!
  var mockView: MockView!

  override func setUp() {
    super.setUp()
    presenter = AlbumPresenter()
    mockInteractor = MockPresenterToInteractor()
    mockRouter = MockRouter()
    mockView = MockView()

    presenter.interactor = mockInteractor
    presenter.router = mockRouter
    presenter.view = mockView
  }

  override func tearDown() {
    presenter = nil
    mockView = nil
    mockInteractor = nil
    mockRouter = nil

    super.tearDown()
  }

  func testThatPresenterHandlesViewReadyEvent() {
    // When
    presenter.didTriggerViewReady()

    // Then
    XCTAssertTrue(mockView.setupViewCalled)
    XCTAssertTrue(mockView.initialStateCalled)
  }

  func testThatViewShowsDataAfterFetching() {
    // When
    presenter.fetchedData(data: [])

    // Then
    XCTAssertTrue(mockView.showDataCalled)
  }

  func testThatInteractorFetchesDataWhenRequested() {
    // When
    presenter.didTriggerViewReady()

    // Then
    XCTAssertTrue(mockInteractor.fecthDataCalled)
  }

  func testThatRouterNavigatesWhenShowingDetail() {
    // When
    presenter.showBuyAlbum(on: UINavigationController(), data: Data())

    // Then
    XCTAssertTrue(mockRouter.pushToWebViewCalled)
  }
}

class MockPresenterToInteractor: AlbumPresenterToInteractorProtocol {
  var fecthDataCalled = false
  func fetchData() {
    fecthDataCalled = true
  }
}

class MockRouter: AlbumPresenterToRouterProtocol {
  var pushToWebViewCalled = false
  func pushToWebView(on navigationController: UINavigationController, data: Any) {
    pushToWebViewCalled = true
  }
}

class MockView: AlbumPresenterToViewProtocol {
  var initialStateCalled = false
  func initialState() {
    initialStateCalled = true
  }

  var setupViewCalled = false
  func setupView() {
    setupViewCalled = true
  }

  var showDataCalled = false
  func showData(data: [Any]) {
    showDataCalled = true
  }

}
