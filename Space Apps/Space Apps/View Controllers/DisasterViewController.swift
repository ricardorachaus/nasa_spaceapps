//
//  DisasterViewController.swift
//  Space Apps
//
//  Created by Ricardo Rachaus on 20/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import UIKit

class DisasterViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "Checklist", sender: self)
    }
    
}
