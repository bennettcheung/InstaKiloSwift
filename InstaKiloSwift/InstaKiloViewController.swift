//
//  InstaKiloViewController.swift
//  InstaKiloSwift
//
//  Created by Bennett on 2018-08-20.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

private let reuseIdentifier = "InstaKiloCell"
private var photoArray:[[Photo]] = [[Photo]()]

class InstaKiloViewController: UICollectionViewController {
  
  @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        imageCollectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
      
        setupDataBySubject()
        
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
          self.collectionView?.reloadData()
      }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

     override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return photoArray.count
    }


     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return photoArray[section].count
    }

     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InstaKiloViewCell
      
      cell.setupCell(photo: photoArray[indexPath.section][indexPath.item])
    
        // Configure the cell
    
        return cell
    }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCell", for: indexPath) as? SectionHeader{
      
      let photo = photoArray[indexPath.section][0]
      if categorySegmentedControl.selectedSegmentIndex == 0{
        sectionHeader.headerLabel.text = photo.subject
      }
      else{
        sectionHeader.headerLabel.text = photo.location
      }
      return sectionHeader
    }
    return UICollectionReusableView()
  }

  
  func setupDataBySubject(){
    photoArray = [
      [Photo.init(withImageName: "travel1", location: "Barcelona", subject: "Sangrada Familia")],
      [Photo.init(withImageName: "travel2", location: "Florence", subject: "Domo")],
      [Photo.init(withImageName: "travel3", location: "Paris", subject: "Effiel Tower")],
      [Photo.init(withImageName: "travel4", location: "London", subject: "Big Ben")],
      [Photo.init(withImageName: "travel5", location: "Barcelona", subject: "Parc Guell")],
      [Photo.init(withImageName: "travel6", location: "Barcelona", subject: "Magic Mountain")],
      [Photo.init(withImageName: "travel7", location: "Rome", subject: "Trevi Fountain")],
      [Photo.init(withImageName: "travel8", location: "Florence", subject: "Church")],
      [Photo.init(withImageName: "travel9", location: "Florence", subject: "Ponte Vecchio")],
      [Photo.init(withImageName: "travel10", location: "Capri", subject: "Beach")]
    ]
  }
  
  func setupDataByLocation(){
    photoArray = [
      [Photo.init(withImageName: "travel1", location: "Barcelona", subject: "Sangrada Familia"),
      Photo.init(withImageName: "travel5", location: "Barcelona", subject: "Parc Guell"),
      Photo.init(withImageName: "travel6", location: "Barcelona", subject: "Magic Mountain")],
      
      [Photo.init(withImageName: "travel2", location: "Florence", subject: "Domo"),
      Photo.init(withImageName: "travel8", location: "Florence", subject: "Church"),
      Photo.init(withImageName: "travel9", location: "Florence", subject: "Ponte Vecchio")],
      
      [Photo.init(withImageName: "travel3", location: "Paris", subject: "Effiel Tower")],
      
      [Photo.init(withImageName: "travel4", location: "London", subject: "Big Ben")],
      
      [Photo.init(withImageName: "travel7", location: "Rome", subject: "Trevi Fountain")],
      
      [Photo.init(withImageName: "travel10", location: "Capri", subject: "Beach")]
    ]
  }

  @IBAction func categoryChanged(_ sender: Any) {
    if categorySegmentedControl.selectedSegmentIndex == 0{
      //sort by subject
      setupDataBySubject()
    }
    else{
      //sort by location
      setupDataByLocation()
      
    }
    DispatchQueue.main.async {
      self.collectionView?.reloadData()
    }
  }
}
