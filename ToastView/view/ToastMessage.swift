//
//  ToastMessage.swift
//  ToastView
//
//  Created by Vincent Berihuete on 11/17/18.
//  Copyright © 2018 devcorerd. All rights reserved.
//

import UIKit

class ToastMessage: UIView {

    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var color = UIColor.black
    var message: String?
    var iconImage: UIImage?
    
    private var touchDismiss = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        setup()
        fatalError("init(coder:) has not been implemented")
        
    }
    
    init(frame: CGRect, backgroundColor color: UIColor = .black, message: String, icon: UIImage?) {
        super.init(frame: frame)
        self.color = color
        self.message = message
        self.iconImage = icon
        setup()
    }
    
    
    /// Setups the view
    func setup(){
        //inflate view
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        //set
        containerView.backgroundColor = color
        messageLabel.text = message
        
        guard let image = iconImage else {
            imageView.isHidden = true
            return
        }
        imageView.image = image
    }
    
    /// Dismiss the current toast message
    ///
    /// - Parameters:
    ///   - animated: whether this will be dismissed animated or not
    ///   - handler: provided once the view has been removed
    func dismiss(animated: Bool = true, completionHandler handler:  @escaping () -> () = { }){
        self.isUserInteractionEnabled = false
        UIView.animate(withDuration: animated ? 0.2 : 0, animations: {
            self.alpha = 0
        }, completion: { (_) in
            self.isUserInteractionEnabled = true
            handler()
            self.removeFromSuperview()
        })
    }
    
    /// Touches began function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touchDismiss else{
            return
        }
        ToastPresenter.shared.remove()
    }
}
