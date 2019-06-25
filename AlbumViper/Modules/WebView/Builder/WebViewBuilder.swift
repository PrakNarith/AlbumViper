//
//  WebViewBuilder.swift
//  AlbumViper
//
//  Created by Narith Prak on 6/25/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import Foundation

class WebViewBuilder {
  class func build(with data: Any) -> WebViewController  {
    let viewController = WebViewController()

    let presenter = WebViewPresenter()
    presenter.view = viewController
    presenter.album = data as? Album
    
    viewController.output = presenter
    
    return viewController
  }
}
