//
//  ViewController.swift
//  tms-stt
//
//  Created by Daniel Elsner on 05.04.17.
//  Copyright © 2017 Elsner & Mense GbR. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var colorChangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeColor(_ sender: Any) {
        colorChangeButton.layer.cornerRadius = 0.5 * colorChangeButton.bounds.size.width
        
        if colorChangeButton.backgroundColor == UIColor.blue {
            colorChangeButton.backgroundColor = UIColor.red
        } else {
            colorChangeButton.backgroundColor = UIColor.blue
        }
        
    }
}

