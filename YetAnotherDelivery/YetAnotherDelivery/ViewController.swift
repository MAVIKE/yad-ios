//
//  ViewController.swift
//  YetAnotherDelivery
//
//  Created by Shamil Imanov on 02.04.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://httpbin.org/get").response { (data) in
            print(data)
            print("kek")
        }
        view.backgroundColor = .purple
    }


}

