//
//  WebViewPresenterToViewProtocol.swift
//  AlbumViper
//
//  Created by Narith Prak on 6/25/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import Foundation

protocol WebViewPresenterToViewProtocol: class {
  func setupView(with url: String)
  func setTitle(with text: String)
}
