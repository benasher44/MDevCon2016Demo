//
//  CorgiSelectionSaver.swift
//  MDevCon2016Demo
//
//  Created by Benjamin Asher on 3/5/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation

let kCorgiSelectionKey = "kCorgiSelectionKey"

class CorgiSelectionSaver: NSObject {
  var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

  func saveCorgiSelection(indexPath: NSIndexPath) {
    userDefaults.setInteger(indexPath.item, forKey: kCorgiSelectionKey)
  }

  func loadCorgiSelection() -> NSIndexPath? {
    if let selection = userDefaults.objectForKey(kCorgiSelectionKey) as? NSNumber {
      return NSIndexPath(forItem: selection.integerValue, inSection: 0)
    } else {
      return nil
    }
  }
}