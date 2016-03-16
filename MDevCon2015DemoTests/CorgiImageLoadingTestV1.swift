//
//  CorgiImageLoadingTest.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/5/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import XCTest

class CorgiImageLoadingTestV1: XCTestCase {
  func testCorgiImageLoading() {
    let viewController = CorgiViewController()
    viewController.loadViewIfNeeded() // Ensure collection view is setup

    let index = 0
    let cell = viewController.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: index, inSection: 0)) as! CorgiCollectionViewCell
    XCTAssertEqual(cell.image, UIImage(named: "corgi0.jpg"))
  }
}
