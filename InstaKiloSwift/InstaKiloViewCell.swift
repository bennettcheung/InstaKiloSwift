//
//  InstaKiloViewCell.swift
//  InstaKiloSwift
//
//  Created by Bennett on 2018-08-20.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class InstaKiloViewCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var subjectLabel: UILabel!
  
  
  func setupCell(photo: Photo){
    
    subjectLabel.text = photo.subject
    locationLabel.text = photo.location
    
    imageView.image = UIImage.init(named: photo.imageName)
    
  }
}
