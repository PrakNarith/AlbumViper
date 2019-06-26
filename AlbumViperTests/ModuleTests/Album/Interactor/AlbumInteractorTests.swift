//
//  AlbumInteractorTests.swift
//  AlbumViperTests
//
//  Created by Narith Prak on 6/25/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import XCTest
@testable import AlbumViper

class AlbumInteractorTests: XCTestCase {
  var interactor: AlbumInteractor!
  var mockOutput: MockPresenterOutput!

  override func setUp() {
    super.setUp()
    interactor = AlbumInteractor()
    mockOutput = MockPresenterOutput()
    interactor.output = mockOutput
  }

  override func tearDown() {
    interactor = nil
    mockOutput = nil

    super.tearDown()
  }

  func testThatPresenterFetchedDataFromInteractor() {
    // When
    interactor.fetchData()

    // Then
    // Todo: stub fetchdata method and use expectation
//    sleep(1)
//    XCTAssertTrue(mockOutput.fetchedDataCalled)
  }

}

class MockPresenterOutput: AlbumInteractorToPresentProtocol {
  var fetchedDataCalled = false
  func fetchedData(data: [Any]) {
    fetchedDataCalled = true
  }
}
