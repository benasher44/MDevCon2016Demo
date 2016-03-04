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
  private let imageView = UIImageView()
  var image: UIImage? {
    didSet {
      imageView.image = image
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView.layer.borderWidth = 4.0
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
  
  override func prepareForReuse() {
    super.prepareForReuse()
    image = nil
  }
  
  override var selected: Bool {
    didSet {
      if selected {
        imageView.layer.borderColor = UIColor.greenColor().CGColor
      } else {
        imageView.layer.borderColor = nil
      }
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}