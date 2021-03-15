//
//  ViewController.swift
//  Youtube clone
//
//  Created by Farrel hasyidan on 15/03/21.
//

import UIKit

class ViewController: UIViewController {
  
  var model = Model()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    model.getVideo()
  }


}

