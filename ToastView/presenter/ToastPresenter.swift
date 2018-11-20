//
//  ToastPresenter.swift
//  ToastView
//
//  Created by Vincent Berihuete on 11/17/18.
//  Copyright © 2018 devcorerd. All rights reserved.
//

import Foundation
import UIKit

class ToastPresenter {
    
    static let shared = ToastPresenter()
    
//    private var toasts: [Int : ToastMessage] = [:]
    
    private var currentToast: ToastMessage?
    
    func show(in view: UIView, message: String, icon: UIImage? = nil, with size: (width: CGFloat, height: CGFloat) = (200, 50), place toastPlace: ToastPlace = .down, animated: Bool = true, backgroundColor: UIColor = .black, timeOut: Double? = nil){

        let toast = ToastMessage(backgroundColor: backgroundColor, message: message, icon: icon, timeOut: timeOut)
        toast.alpha = animated ? 0 : 1
//        toast.tag = toasts.count
//        toasts.append(toast)
        if let currentToast = currentToast{
            currentToast.dismiss {
                self.add(toast, to: view, animated: animated)
                toast.constraint(in: view, place: toastPlace, with: size)
                self.slide(up: toast)
            }
        }else{
            self.add(toast, to: view, animated: animated)
            toast.constraint(in: view, place: toastPlace, with: size)
            slide(up: toast)
        }
        
//        toast.widthAnchor.constraint(equalToConstant: size.width).isActive = true
//        toast.heightAnchor.constraint(equalToConstant: size.height).isActive = true
//        toast.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        toast.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: size.height * -1).isActive = true
    }
    
    
    /// Removes the current showing toast
    func remove(){
        currentToast?.dismiss()
        currentToast = nil
        
    }
    
    private func add(_ toast: ToastMessage, to view: UIView, animated: Bool){
        self.currentToast = toast
        view.addSubview(toast)
        
//        if animated {
//            UIView.animate(withDuration: 0.2) {
//                toast.alpha = 1
//            }
//        }
    }
    
    private func slide(up view: UIView){
        UIView.animate(withDuration: 0.2){
            view.alpha = 1
            view.center.y -= 10
        }
    }
}

enum ToastPlace{
    case up
    case down
//    case right
//    case left
}

enum ToastRoundness{
    case none
    case low
    case mid
    case high
}
