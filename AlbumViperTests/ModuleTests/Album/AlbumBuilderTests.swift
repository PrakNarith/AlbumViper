//
//  AlbumBuilderTests.swift
//  AlbumViperTests
//
//  Created by Narith Prak on 6/26/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import XCTest
@testable import AlbumViper

class AlbumBuilderTests: XCTestCase {

  func testBuilder() {
    //Given
    let builder = AlbumBuilder()

    //When
    let viewController = builder.build()

    //Then
    XCTAssertNotNil(viewController.presenter)
    XCTAssertTrue(viewController.presenter is AlbumPresenter)

    let presenter = viewController.presenter as! AlbumPresenter
    XCTAssertNotNil(presenter.view)
    XCTAssertNotNil(presenter.router)
    XCTAssertTrue(presenter.router is AlbumRouter)

    let interactor = presenter.interactor as! AlbumInteractor
    XCTAssertNotNil(interactor)
  }
}
