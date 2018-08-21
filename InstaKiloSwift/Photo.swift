//
//  Photo.swift
//  InstaKiloSwift
//
//  Created by Bennett on 2018-08-20.
//  Copyright © 2018 Bennett. All rights reserved.
//

import Foundation
import UIKit

struct Photo{
  
  var imageName: String = ""
  var location: String  = ""
  var subject: String = ""
  var image: UIImage?
  
  init(withImageName: String, location: String, subject: String) {
    self.imageName = withImageName
    self.location = location
    self.subject = subject
  }

  
}
