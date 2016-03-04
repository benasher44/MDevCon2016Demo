//
//  AppDelegate.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/3/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import UIKit

public class AppDelegate: UIResponder, UIApplicationDelegate {
  public var window: UIWindow?
  
  public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window = window
    
    window.rootViewController = CorgiViewController()
    window.makeKeyAndVisible()
    
    return true
  }
}