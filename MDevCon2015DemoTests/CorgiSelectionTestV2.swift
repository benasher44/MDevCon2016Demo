//
//  CorgiSelectionTestV2.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/5/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import XCTest


class NumberMap: CorgiSelectionStore {
  var dict = [String: NSNumber]()

  func setInteger(value: Int, forKey defaultName: String) {
    dict[defaultName] = NSNumber(integer: value)
  }

  func integerForKey(defaultName: String) -> Int {
    return dict[defaultName]?.integerValue ?? 0
  }

  func objectForKey(defaultName: String) -> AnyObject? {
    return dict[defaultName]
  }
}



class CorgiSelectionTestV2: XCTestCase {
  func testCorgiSelectionSaver() {
    let store = NumberMap()
    let saver = CorgiSelectionSaver()
    saver.userDefaults = store

    // Make sure we start with no selection
    XCTAssertNil(saver.loadCorgiSelection())

    let indexPath = NSIndexPath(forItem: 5, inSection: 0)
    saver.saveCorgiSelection(indexPath)

    XCTAssertEqual(store.integerForKey(kCorgiSelectionKey), indexPath.item)
  }
}
