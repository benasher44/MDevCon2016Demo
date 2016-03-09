//
//  CorgiCollectionController.swift
//  MDevCon2015Demo
//
//  Created by Ben Asher on 3/9/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import UIKit

let kNumTiles = 100
let kNumCorgis = 4
let kCorgiSpacing = CGFloat(10)

class CorgiCollectionController: NSObject {
  private let selectionSaver = CorgiSelectionSaver()

  lazy var collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.minimumInteritemSpacing = kCorgiSpacing
    flowLayout.minimumLineSpacing = 0
    flowLayout.sectionInset = UIEdgeInsets(top: kCorgiSpacing, left: kCorgiSpacing, bottom: kCorgiSpacing, right: kCorgiSpacing)
    let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.registerClass(CorgiCollectionViewCell.self, forCellWithReuseIdentifier: String(CorgiCollectionViewCell))
    return collectionView
  }()

  func loadRecentCorgiSelection() {
    if let selection = selectionSaver.loadCorgiSelection() {
      collectionView.selectItemAtIndexPath(selection, animated: true, scrollPosition: .CenteredVertically)
    }
  }

  func loadCorgis() {
    collectionView.reloadData()
  }
}

extension CorgiCollectionController: UICollectionViewDelegate {
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    selectionSaver.saveCorgiSelection(indexPath)
  }
}

extension CorgiCollectionController: UICollectionViewDataSource {

  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(CorgiCollectionViewCell), forIndexPath: indexPath) as! CorgiCollectionViewCell
    let imageIndex = indexPath.item % kNumCorgis
    let imageName = "corgi\(imageIndex).jpg"
    cell.image = UIImage(named: imageName)
    return cell
  }

  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int { return 1; }
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return kNumTiles; }
}

extension CorgiCollectionController: UICollectionViewDelegateFlowLayout {
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let corgisPerRow = kNumCorgis / 2
    let corgiSizeDimension = (collectionView.bounds.width - 3 * kCorgiSpacing) / CGFloat(corgisPerRow)
    return CGSize(width: corgiSizeDimension, height: corgiSizeDimension)
  }
}
