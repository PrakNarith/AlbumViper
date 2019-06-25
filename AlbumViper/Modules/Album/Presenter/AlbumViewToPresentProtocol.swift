//
//  AlbumViewToPresentProtocol.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import UIKit

protocol AlbumViewToPresentProtocol: class {
  func didTriggerViewReady()
  func showBuyAlbum(on navController: UINavigationController, data: Any)
}
