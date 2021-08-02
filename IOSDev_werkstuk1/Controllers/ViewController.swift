//
//  ViewController.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 31/07/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var VacCents: [VacCent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Voeg vaccinatiecentrum toe"
        // Do any additional setup after loading the view.
        
        if VacCents.isEmpty {
            print("empty")
        }else{
            for vac in VacCents {
                print(vac.naam)
            }
        }
    }
    
    
    
    


}

