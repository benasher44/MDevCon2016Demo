//
//  CorgiSelectionStore.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/5/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation

protocol CorgiSelectionStore {
  func objectForKey(defaultName: String) -> AnyObject?
  func setInteger(value: Int, forKey defaultName: String)
}

extension NSUserDefaults: CorgiSelectionStore {}