//
//  RootViewController.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/3/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import UIKit

let kNumTiles = 100
let kNumCorgis = 4
let kCorgiSpacing = CGFloat(10)

class RootViewController: UIViewController {
  var collectionView: UICollectionView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.minimumInteritemSpacing = kCorgiSpacing
    flowLayout.minimumLineSpacing = 0
    flowLayout.sectionInset = UIEdgeInsets(top: kCorgiSpacing, left: kCorgiSpacing, bottom: kCorgiSpacing, right: kCorgiSpacing)
    let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.registerClass(CorgiCollectionViewCell.self, forCellWithReuseIdentifier: String(CorgiCollectionViewCell))
    view.addSubview(collectionView)
    self.collectionView = collectionView
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    collectionView?.reloadData()
  }
}

extension RootViewController: UICollectionViewDataSource {
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1;
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return kNumTiles;
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(CorgiCollectionViewCell), forIndexPath: indexPath)
    let corgiCell = cell as! CorgiCollectionViewCell
    let imageIndex = indexPath.row % kNumCorgis
    corgiCell.image = UIImage(named: "corgi\(imageIndex).jpg")
    return corgiCell
  }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let corgisPerRow = kNumCorgis / 2
    let corgiSizeDimension = (view.bounds.width - 3 * kCorgiSpacing) / CGFloat(corgisPerRow)
    return CGSize(width: corgiSizeDimension, height: corgiSizeDimension)
  }
}
