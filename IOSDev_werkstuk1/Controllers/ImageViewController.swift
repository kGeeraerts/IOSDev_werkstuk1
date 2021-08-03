//
//  ImageViewController.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 03/08/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var location: String!
    var saved: Bool!

    @IBOutlet weak var picture: UIImageView!
    
    
    func getPicture(name: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent("\(name).png").path)
        }else {
            return nil
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(location)
        
        if saved {
            picture.image = getPicture(name:"\(location!).png")
        }else{
            picture.image = UIImage(named: "default.jpg")
        }
        
    }
    

    

}
