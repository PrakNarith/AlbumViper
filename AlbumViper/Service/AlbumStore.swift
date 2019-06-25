//
//  AlbumStore.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import Foundation

public class AlbumStore: AlbumService {

  public static let shared = AlbumStore()
  private init() {}
  private let baseAPIURL = "http://rallycoding.herokuapp.com/api/"
  private let urlSession = URLSession.shared

  func fetchAlbum(from endPoint: EndPoint,
                  successHandler: @escaping ([Album]) -> Void,
                  errorHandler: @escaping (Error) -> Void) {
    guard let urlComponent = URLComponents(string: "\(baseAPIURL)\(endPoint.rawValue)") else {
      return errorHandler(AlbumError.invalidEndpoint)
    }

    guard let url = urlComponent.url else {
      return errorHandler(AlbumError.invalidEndpoint)
    }

    urlSession.dataTask(with: url) { (data, response, error) in
      if error != nil {
        self.handleError(errorHandler: errorHandler, error: AlbumError.apiError)
        return
      }

      guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
        self.handleError(errorHandler: errorHandler, error: AlbumError.invalidResponse)
        return
      }

      guard let data = data else {
        self.handleError(errorHandler: errorHandler, error: AlbumError.noData)
        return
      }

      do {
        let albumResponse = try JSONDecoder().decode([Album].self, from: data)
        DispatchQueue.main.async {
          successHandler(albumResponse)
        }
      } catch {
        self.handleError(errorHandler: errorHandler, error: AlbumError.serializationError)
      }
    }.resume()
  }

  private func handleError(errorHandler: @escaping(_ error: Error) -> Void, error: Error) {
    DispatchQueue.main.async {
      errorHandler(error)
    }
  }
}
