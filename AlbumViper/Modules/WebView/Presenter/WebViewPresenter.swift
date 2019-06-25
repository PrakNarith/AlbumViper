//
//  WebViewPresenter.swift
//  AlbumViper
//
//  Created by Narith Prak on 6/25/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import Foundation

class WebViewPresenter {
  var view: WebViewPresenterToViewProtocol!
  var album: Album?
}

extension WebViewPresenter: WebViewToPresenterProtocol {
  func viewIsReady() {
    view.setupView(with: (album?.url)!)
    view.setTitle(with: (album?.title)!)
  }

}
