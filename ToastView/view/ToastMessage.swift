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
    var timeOut: Double?
    
    private var touchDismiss = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        setup()
        fatalError("init(coder:) has not been implemented")
        
    }
    
    init(backgroundColor color: UIColor = .black, message: String, icon: UIImage?, timeOut: Double? = nil) {
        super.init(frame: CGRect.zero)
        self.color = color
        self.message = message
        self.iconImage = icon
        self.timeOut = timeOut
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
        
        if let timeOut = self.timeOut{
            DispatchQueue.main.asyncAfter(deadline: .now() + timeOut) {
                ToastPresenter.shared.remove()
            }
        }
        
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
            self.center.y += 10
        }, completion: { (_) in
            self.isUserInteractionEnabled = true
            handler()
            self.removeFromSuperview()
        })
    }
    
    
    /// Assigns auto layout anchor constraints with the given parameters based on the toast place
    ///
    /// - Parameters:
    ///   - view: The view to constraint against
    ///   - toastPlace: the place where the toast is being constrained
    ///   - size: the size of the desired constraints
    func constraint(in view: UIView, place toastPlace: ToastPlace, with size: (width: CGFloat, height: CGFloat)){
        layer.masksToBounds = true
        layer.cornerRadius = size.width / 8
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if toastPlace == .down{
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: size.height * -1).isActive = true
        }else if toastPlace == .up{
            topAnchor.constraint(equalTo: view.topAnchor, constant: size.height).isActive = true
        }
        
    }
    
    /// Touches began function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touchDismiss else{
            return
        }
        ToastPresenter.shared.remove()
    }
}
