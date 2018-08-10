//
//  MainProfileViewController.swift
//  EurekaTesting
//
//  Created by Saeed on 09.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import Eureka

class MainProfileViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section()
            <<< ProfileInfoRow(){ row in
                row.value = User(username: "epicsaeed", jersey: "23", team: "F.C.B", image: #imageLiteral(resourceName: "Puggy"))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
