//
//  CorgiImageLoadingTestV2.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/5/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import XCTest

class CorgiImageLoadingTestV2: XCTestCase {
  func testCorgiImageLoading() {
    let index = 0
    XCTAssertEqual(corgiImageName(NSIndexPath(forItem: index, inSection: 0)), "corgi0.jpg")
  }
}
