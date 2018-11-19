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
    
    func show(in view: UIView, message: String, icon: UIImage? = nil, with size: (width: CGFloat, height: CGFloat) = (200, 50), place toastPlace: ToastPlace = .down, animated: Bool = true, backgroundColor: UIColor = .black, autoDismiss: Bool = true){
        let safeInsets = view.safeAreaInsets
        
        var x: CGFloat = view.frame.size.width / 2 - (size.width / 2)
        var y: CGFloat = 0
        
        switch toastPlace {
        case .up:
            y = safeInsets.top + (size.height * 2)
        default:
            x = view.frame.size.width / 2 - (size.width / 2)
            y = view.frame.size.height - safeInsets.bottom - (size.height * 2)
        }
        
        let toast = ToastMessage(frame: CGRect(x: x, y: y, width: size.width, height: size.height), backgroundColor: backgroundColor, message: message, icon: icon)
        toast.alpha = animated ? 0 : 1
//        toast.tag = toasts.count
//        toasts.append(toast)
        currentToast?.dismiss(){
            self.currentToast = toast
            view.addSubview(toast)
            
            if animated {
                UIView.animate(withDuration: 0.2) {
                    toast.alpha = 1
                }
            }
        }
        
    }
    
    
    /// Removes the current showing toast
    func remove(){
        currentToast?.dismiss()
        currentToast = nil
        
    }
}

enum ToastPlace{
    case up
    case down
//    case right
//    case left
}
