//
//  AppDelegate.swift
//  AlbumViper
//
//  Created by Narith Prak on 6/24/19.
//  Copyright © 2019 Narith Prak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let builder = AlbumBuilder()
    let controller = builder.build()
    let navigationController = UINavigationController()
    navigationController.viewControllers = [controller]
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    return true
  }

}

