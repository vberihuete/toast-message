//
//  ViewController.swift
//  ToastView
//
//  Created by Vincent Berihuete on 11/17/18.
//  Copyright © 2018 devcorerd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showRightAction(_ sender: Any) {
    }
    @IBAction func showLeftAction(_ sender: Any) {
    }
    @IBAction func showDownAction(_ sender: Any) {
        ToastPresenter.shared.show(in: self.view, message: "This is a toast!", timeOut: 4)
    }
    @IBAction func showUpAction(_ sender: Any) {
        ToastPresenter.shared.show(in: view, message: "From up", place: .up)
    }
}

