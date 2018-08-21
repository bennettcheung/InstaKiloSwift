//
//  DetailViewController.swift
//  InstaKiloSwift
//
//  Created by Bennett on 2018-08-20.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   var photo:Photo?
  @IBOutlet weak var imageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      imageView.image = UIImage.init(named: (photo?.imageName)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
