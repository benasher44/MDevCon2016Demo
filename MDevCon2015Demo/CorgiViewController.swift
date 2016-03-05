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

let kCorgiSelectionKey = "kCorgiSelectionKey"

class CorgiViewController: UIViewController {
  var collectionView: UICollectionView?
  var userDefaults = NSUserDefaults.standardUserDefaults()
  
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
  
    if let selectionNum = userDefaults.objectForKey(kCorgiSelectionKey) as? NSNumber {
      let selectedIndexPath = NSIndexPath(forItem: selectionNum.integerValue, inSection: 0)
      collectionView?.selectItemAtIndexPath(selectedIndexPath, animated: true, scrollPosition: .CenteredVertically)
    }
  }
  
  func didSelectCorgi(atIndex index: Int) {
    userDefaults.setInteger(index, forKey: kCorgiSelectionKey)
  }
}

extension CorgiViewController: UICollectionViewDataSource {
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1;
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return kNumTiles;
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(CorgiCollectionViewCell), forIndexPath: indexPath)
    let corgiCell = cell as! CorgiCollectionViewCell
    let imageIndex = indexPath.item % kNumCorgis
    corgiCell.image = UIImage(named: "corgi\(imageIndex).jpg")
    return corgiCell
  }
}

extension CorgiViewController: UICollectionViewDelegate {
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    userDefaults.setInteger(indexPath.item, forKey: kCorgiSelectionKey)
  }
}

extension CorgiViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let corgisPerRow = kNumCorgis / 2
    let corgiSizeDimension = (view.bounds.width - 3 * kCorgiSpacing) / CGFloat(corgisPerRow)
    return CGSize(width: corgiSizeDimension, height: corgiSizeDimension)
  }
}