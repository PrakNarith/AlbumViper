//
//  AlbumView.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/24/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import UIKit

protocol AlbumViewDelegate: class {
  func buyAction(album: Album)
}

class AlbumView: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var albumName: UILabel!
  @IBOutlet weak var singerName: UILabel!

  weak var delegate: AlbumViewDelegate!
  var album: Album!

  func configure(with album: Album) {
    singerName.text = album.artist
    albumName.text = album.title
    imageView.cacheImage(urlString: album.image!)
    self.album = album
  }

  @IBAction func buyAction(_ sender: Any) {
    delegate.buyAction(album: album)
  }
}
