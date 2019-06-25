//
//  MovieService.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import Foundation

protocol AlbumService {
  func fetchAlbum(from endPoint: EndPoint,
                  successHandler: @escaping (_ response: [Album] ) -> Void,
                  errorHandler: @escaping (_ error: Error) -> Void)
}

public enum EndPoint: String, CaseIterable {
  case musicAlbums = "music_albums"
}

public enum AlbumError: Error {
  case apiError
  case invalidEndpoint
  case invalidResponse
  case noData
  case serializationError
}
