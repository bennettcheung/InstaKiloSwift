//
//  InstaKiloViewCell.swift
//  InstaKiloSwift
//
//  Created by Bennett on 2018-08-20.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class InstaKiloViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var subjectLabel: UILabel!
  var pan: UIPanGestureRecognizer!
  var deleteLabel: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func setupCell(photo: Photo){
    
    subjectLabel.text = photo.subject
    locationLabel.text = photo.location
    
    imageView.image = UIImage.init(named: photo.imageName)
    
  }
  
  private func commonInit() {
    self.contentView.backgroundColor = UIColor.gray
    self.backgroundColor = UIColor.red
    
    deleteLabel = UILabel()
    deleteLabel.text = "delete"
    deleteLabel.textColor = UIColor.white
    self.insertSubview(deleteLabel, belowSubview: self.contentView)
    
    pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
    pan.delegate = self
    self.addGestureRecognizer(pan)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    if (pan.state == UIGestureRecognizerState.changed) {
      let p: CGPoint = pan.translation(in: self)
      let width = self.contentView.frame.width
      let height = self.contentView.frame.height
      self.contentView.frame = CGRect(x: p.x,y: 0, width: width, height: height);
      self.deleteLabel.frame = CGRect(x: p.x - deleteLabel.frame.size.width-10, y: 0, width: 60, height: height)
    }
    
  }
  
  @objc func onPan(_ pan: UIPanGestureRecognizer) {
    if pan.state == UIGestureRecognizerState.began {
      
    } else if pan.state == UIGestureRecognizerState.changed {
      self.setNeedsLayout()
    } else {
      if pan.velocity(in: self).x > 200 {
        let collectionView: UICollectionView = self.superview as! UICollectionView
        let indexPath: IndexPath = collectionView.indexPathForItem(at: self.center)!
        collectionView.delegate?.collectionView!(collectionView, performAction: #selector(onPan(_:)), forItemAt: indexPath, withSender: nil)
      } else {
        UIView.animate(withDuration: 0.2, animations: {
          self.setNeedsLayout()
          self.layoutIfNeeded()
        })
      }
    }
  }
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
  
  override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return abs((pan.velocity(in: pan.view)).x) > abs((pan.velocity(in: pan.view)).y)
  }
  
}
