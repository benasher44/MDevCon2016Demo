//
//  CorgiImageHelpers.swift
//  MDevCon2016Demo
//
//  Created by Benjamin Asher on 3/5/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation

func corgiImageName(indexPath: NSIndexPath) -> String {
  let imageIndex = indexPath.item % kNumCorgis
  return "corgi\(imageIndex).jpg"
}
