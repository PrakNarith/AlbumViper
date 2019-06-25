//
//  AlbumRouter.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import UIKit

class AlbumRouter {}

extension AlbumRouter: AlbumPresenterToRouterProtocol {
  func pushToWebView(on navigationController: UINavigationController, data: Any) {
    let webView = WebViewBuilder.build(with: data)
    navigationController.pushViewController(webView, animated: true)
  }
}
