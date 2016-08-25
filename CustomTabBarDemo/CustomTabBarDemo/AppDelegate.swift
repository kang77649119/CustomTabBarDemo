//
//  AppDelegate.swift
//  CustomTabBarDemo
//
//  Created by 也许、 on 16/8/25.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MainVC()
        self.window?.makeKeyAndVisible()
        
        return true
    }



}

