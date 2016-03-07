//
//  CorgiCollectionViewLayout.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/5/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import UIKit

let kCorgiSpacing = CGFloat(10)

extension CorgiViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let corgisPerRow = kNumCorgis / 2
    let corgiSizeDimension = (view.bounds.width - 3 * kCorgiSpacing) / CGFloat(corgisPerRow)
    return CGSize(width: corgiSizeDimension, height: corgiSizeDimension)
  }
}
