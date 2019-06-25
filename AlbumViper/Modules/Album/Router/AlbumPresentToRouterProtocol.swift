//
//  AlbumPresentToRouterProtocol.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import UIKit

protocol AlbumPresenterToRouterProtocol: class {
  func pushToWebView(on navigationController: UINavigationController,
                      data: Any)
}
