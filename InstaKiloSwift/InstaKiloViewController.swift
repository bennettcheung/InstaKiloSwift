//
//  InstaKiloViewController.swift
//  InstaKiloSwift
//
//  Created by Bennett on 2018-08-20.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

private let reuseIdentifier = "InstaKiloCell"
private var photoArray:[Photo] = [Photo]()

class InstaKiloViewController: UICollectionViewController {
  @IBOutlet weak var imageCollectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        imageCollectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
      
        setupData()
        
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
          self.imageCollectionView.reloadData()
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
        return 1
    }


     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return photoArray.count
    }

     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! InstaKiloViewCell
      
      cell.setupCell(photo: photoArray[indexPath.item])
    
        // Configure the cell
    
        return cell
    }

  
  func setupData(){
    photoArray = [
      Photo.init(withImageName: "travel1", location: "Barcelona", subject: "Sangrada Familia"),
      Photo.init(withImageName: "travel2", location: "Florence", subject: "Domo"),
      Photo.init(withImageName: "travel3", location: "Paris", subject: "Effiel Tower"),
      Photo.init(withImageName: "travel4", location: "Londno", subject: "Big Ben"),
      Photo.init(withImageName: "travel5", location: "Barcelona", subject: "Parc Guell"),
      Photo.init(withImageName: "travel6", location: "Barcelona", subject: "Magic Mountain"),
      Photo.init(withImageName: "travel7", location: "Rome", subject: "Trevi Fountain"),
      Photo.init(withImageName: "travel8", location: "Florence", subject: "Church"),
      Photo.init(withImageName: "travel9", location: "Florence", subject: "Ponte Vecchio"),
      Photo.init(withImageName: "travel10", location: "Capri", subject: "Beach")
    ]
  }

}
