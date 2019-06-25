//
//  AlbumInteractor.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import Foundation

class AlbumInteractor {
  weak var output: AlbumInteractorToPresentProtocol!
  let albumService = AlbumStore.shared
}

extension AlbumInteractor: AlbumPresenterToInteractorProtocol {
  func fetchData() {
    albumService.fetchAlbum(from: .musicAlbums, successHandler: { [weak self] (albums) in
      guard let strongSelf = self else { return }
      strongSelf.output.fetchedData(data: albums)
    }) { (error) in
      print(error)
    }
  }
}
