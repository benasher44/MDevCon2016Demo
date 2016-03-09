//
//  CorgiViewControllerHelpers.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/5/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import UIKit

extension CorgiViewController {
  func newCorgiCollectionView() -> UICollectionView {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.minimumInteritemSpacing = kCorgiSpacing
    flowLayout.minimumLineSpacing = 0
    flowLayout.sectionInset = UIEdgeInsets(top: kCorgiSpacing, left: kCorgiSpacing, bottom: kCorgiSpacing, right: kCorgiSpacing)
    let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.registerClass(CorgiCollectionViewCell.self, forCellWithReuseIdentifier: String(CorgiCollectionViewCell))
    return collectionView
  }
}
