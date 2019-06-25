//
//  AlbumPresenterToViewProtocol.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

protocol AlbumPresenterToViewProtocol: class {
  func initialState()
  func setupView()
  func showData(data: [Any])
}
