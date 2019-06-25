//
//  Album.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/21/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import Foundation

struct Album: Codable {
  let title: String?
  let artist: String?
  let url: String?
  let image: String?
  let thumbnail_image: String?

  enum CodingKeys: String, CodingKey {

    case title = "title"
    case artist = "artist"
    case url = "url"
    case image = "image"
    case thumbnail_image = "thumbnail_image"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    artist = try values.decodeIfPresent(String.self, forKey: .artist)
    url = try values.decodeIfPresent(String.self, forKey: .url)
    image = try values.decodeIfPresent(String.self, forKey: .image)
    thumbnail_image = try values.decodeIfPresent(String.self, forKey: .thumbnail_image)
  }

}
