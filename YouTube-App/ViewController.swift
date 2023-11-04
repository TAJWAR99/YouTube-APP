//
//  ViewController.swift
//  YouTube-App
//
//  Created by Sihan on 2/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    let model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

 
