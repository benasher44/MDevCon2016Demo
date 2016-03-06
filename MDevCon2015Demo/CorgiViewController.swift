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

class CorgiViewController: UIViewController {
  var collectionView: UICollectionView?
  private let selectionSaver = CorgiSelectionSaver()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let collectionView = newCorgiCollectionView()
    view.addSubview(collectionView)
    self.collectionView = collectionView
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    collectionView?.reloadData()
    if let selection = selectionSaver.loadCorgiSelection() {
      collectionView?.selectItemAtIndexPath(selection, animated: true, scrollPosition: .CenteredVertically)
    }
  }
}

extension CorgiViewController: UICollectionViewDelegate {
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    selectionSaver.saveCorgiSelection(indexPath)
  }
}

extension CorgiViewController: UICollectionViewDataSource {

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
