//
//  CorgiCollectionViewCell.swift
//  MDevCon2015Demo
//
//  Created by Benjamin Asher on 3/3/16.
//  Copyright © 2016 Benjamin Asher. All rights reserved.
//

import Foundation
import UIKit

class CorgiCollectionViewCell: UICollectionViewCell {
  let imageView = UIImageView()
  var image: UIImage? {
    didSet(newImage) {
      imageView.image = newImage
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView.contentMode = .ScaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(imageView)
    
    let views = ["imageView": imageView]
    let constraints = [
      NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|", options: NSLayoutFormatOptions(), metrics: nil, views: views),
      NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|", options: NSLayoutFormatOptions(), metrics: nil, views: views)
    ] 
    NSLayoutConstraint.activateConstraints(constraints.flatMap({$0}))
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}