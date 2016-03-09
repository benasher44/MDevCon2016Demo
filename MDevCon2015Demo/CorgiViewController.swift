//
//  RootViewController.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/3/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import UIKit

class CorgiViewController: UIViewController {
  let controller = CorgiCollectionController()

  override func loadView() {
    view = controller.collectionView
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    controller.loadCorgis()
    controller.loadRecentCorgiSelection()
  }
}
