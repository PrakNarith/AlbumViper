//
//  WebViewController.swift
//  AlbumViper
//
//  Created by Narith Prak on 6/25/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

  var output: WebViewToPresenterProtocol!
  var webView: WKWebView!

  override func viewDidLoad() {
    super.viewDidLoad()
    output.viewIsReady()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.isNavigationBarHidden = true
  }

  override func loadView() {
    webView = WKWebView()
    webView.navigationDelegate = self
    view = webView
  }
}

extension WebViewController: WebViewPresenterToViewProtocol, WKNavigationDelegate {
  func setupView(with url: String) {
    navigationController?.isNavigationBarHidden = false

    let urlRequest = URL(string: url)!
    webView.load(URLRequest(url: urlRequest))
    webView.allowsBackForwardNavigationGestures = true
  }

  func setTitle(with text: String) {
    title = text
  }
}
