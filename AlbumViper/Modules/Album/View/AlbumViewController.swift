//
//  AlbumViewController.swift
//  Movie_Viper
//
//  Created by Narith Prak on 6/20/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController, UICollectionViewDelegateFlowLayout {

  @IBOutlet private weak var collectionView: UICollectionView!
  @IBOutlet weak var pageControl: UIPageControl!
  
  var presenter: AlbumViewToPresentProtocol!
  var albums: [Album] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.didTriggerViewReady()
  }
}

extension AlbumViewController: AlbumPresenterToViewProtocol {
  func initialState() {
    self.navigationController?.isNavigationBarHidden = true
    pageControl.currentPage = 0
  }

  func setupView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    collectionView.collectionViewLayout = layout
    collectionView.backgroundColor = .white
    collectionView.register(UINib(nibName: "AlbumView", bundle: nil), forCellWithReuseIdentifier: "cellId")
    collectionView.isPagingEnabled = true
  }

  func showData(data: [Any]) {
    DispatchQueue.main.async {
      guard let data = data as? [Album] else { return }
      self.albums = data
      self.pageControl.numberOfPages = data.count
      self.collectionView.reloadData()
    }
  }
}


extension AlbumViewController: AlbumViewDelegate {
  func buyAction(album: Album) {
    guard let navigationController = navigationController else { return }
    presenter.showBuyAlbum(on: navigationController, data: album)
  }
}
