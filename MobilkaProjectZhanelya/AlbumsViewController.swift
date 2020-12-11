//
//  AlbumsViewController.swift
//  MobilkaProjectZhanelya
//
//  Created by Zhanelya Irmakhamed on 10/18/20.
//  Copyright © 2020 Zhanelya Irmakhamed. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    
  @IBOutlet weak var image: UIImageView!
      @IBOutlet weak var nameLabel: UILabel!
                                
                                  
    var dataName: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(data: try! Data(contentsOf: URL(string: dataName.artworkUrl60)!))
        nameLabel.text = dataName.artistName
      
    }
    

  
}
