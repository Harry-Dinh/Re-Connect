//
//  ColorsDetailVC.swift
//  RandomColors
//
//  Created by Harry Dinh on 2023-05-04.
//

import UIKit

class ColorsDetailVC: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
    }
}
