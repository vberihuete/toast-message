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
        ToastPresenter.shared.show(in: self.view, message: "This is a toast!")
    }
    @IBAction func showUpAction(_ sender: Any) {
        ToastPresenter.shared.show(in: view, message: "From up", place: .up)
    }
    
    func showToast(){
////        let area = UIEdgeInsets()
//        let safeInsets = view.safeAreaInsets
//        let toast  = ToastMessage(frame: CGRect(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height - safeInsets.bottom - 50, width: 200, height: 50))
////        toast.isHidden = true
//        toast.alpha = 0
//        self.view.addSubview(toast)
//        UIView.animate(withDuration: 0.2) {
//            toast.alpha = 1
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
////            UIView.animate(withDuration: 0.2) {
////                toast.alpha = 0
////            }
////            UIView.animate(withDuration: 0.2, animations: {
////                toast.alpha = 0
////            }, completion: { (_) in
////                toast.removeFromSuperview()
////            })
//
//        }
        ToastPresenter.shared.show(in: self.view, message: "This is a toast!")
    }
    
}

