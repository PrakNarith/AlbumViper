//
//  AlbumBuilder.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import UIKit

class AlbumBuilder {
  func build() -> AlbumViewController {
    let viewController = UIStoryboard.init(name: "Main", bundle: nil)
      .instantiateViewController(identifier: "AlbumViewController") as! AlbumViewController
    let presenter = AlbumPresenter()
    let router = AlbumRouter()
    let interactor = AlbumInteractor()


    presenter.view = viewController
    presenter.router = router


    interactor.output = presenter
    presenter.interactor = interactor
    viewController.presenter = presenter

    return viewController
  }
}
