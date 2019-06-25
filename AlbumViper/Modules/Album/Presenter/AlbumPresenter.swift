//
//  AlbumPresenter.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import UIKit

class AlbumPresenter {
  weak var view: AlbumPresenterToViewProtocol!
  var router: AlbumPresenterToRouterProtocol!
  var interactor: AlbumPresenterToInteractorProtocol!
}

extension AlbumPresenter: AlbumViewToPresentProtocol {
  func didTriggerViewReady() {
    view.initialState()
    view.setupView()
    interactor.fetchData()
  }

  func showBuyAlbum(on navController: UINavigationController, data: Any) {
    router.pushToWebView(on: navController, data: data)
  }
}

extension AlbumPresenter: AlbumInteractorToPresentProtocol {
  func fetchedData(data: [Any]) {
    view.showData(data: data)
  }
}
