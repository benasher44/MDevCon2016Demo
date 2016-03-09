//
//  CorgiSelectionTest.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/5/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import XCTest

class CorgiSelectionTest: XCTestCase {
  func testCorgiSelectionSaver() {
    let saver = CorgiSelectionSaver()

    // Make sure we start with no selection
    XCTAssertNil(saver.loadCorgiSelection())

    let indexPath = NSIndexPath(forItem: 5, inSection: 0)
    saver.saveCorgiSelection(indexPath)

    XCTAssertEqual(NSUserDefaults.standardUserDefaults().integerForKey(kCorgiSelectionKey), indexPath.item)
  }
}