
import Foundation
import UIKit
import CommonCrypto
import LocalAuthentication
extension UIView {
    
    @IBInspectable var CornerRadious: CGFloat{
        set{
            layer.cornerRadius = newValue
            if newValue > 0{
                layer.masksToBounds = true
            }else{
                layer.masksToBounds = false
            }
        }
        
        get{
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var shadowOffsetWidth: CGFloat{
        set{
            layer.shadowOffset.width = newValue
        }
        
        get{
            return layer.shadowOffset.width
        }
    }
    
    @IBInspectable var shadowOffsetHeight: CGFloat{
        set{
            layer.shadowOffset.height = newValue
        }
        
        get{
            return layer.shadowOffset.height
        }
    }
    
    @IBInspectable var shadowColor: UIColor{
        set{
            layer.shadowColor = newValue.cgColor
        }
        
        get{
            return UIColor(cgColor:layer.shadowColor ?? UIColor.white.cgColor)
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat{
        set{
            layer.shadowRadius = newValue
        }
        
        get{
            return layer.shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        set{
            layer.shadowOpacity = newValue
        }
        
        get{
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable var clipsToBound: Bool{
        set{
            clipsToBounds = newValue
        }
        
        get{
            return clipsToBounds
        }
    }
    
    @IBInspectable var masksToBound: Bool{
        set{
            layer.masksToBounds = newValue
        }
        
        get{
            return layer.masksToBounds
        }
    }
    
    @IBInspectable var path: Bool{
        set{
            if path {
                self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            }
        }
        
        get{
            return (self.layer.shadowPath != nil) ? true : false
        }
    }
    
    @IBInspectable var borderWidth: CGFloat{
        set{
            layer.borderWidth = newValue
        }
        
        get{
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor{
        set{
            layer.borderColor = newValue.cgColor
        }
        
        get{
            return UIColor(cgColor:layer.borderColor ?? UIColor.white.cgColor)
        }
    }
    
    
    
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
  
    
    
}
extension UIViewController{
    
    public func displayMessage(_ msg: String?, callback:(()->(Void))? = nil){
        DispatchQueue.main.async {
            self.displayMessage(title: nil, msg: msg, callback: callback)
        }
    }
    public func displayMessage(title: String?, msg: String?, callback:(()->(Void))? = nil){
        
        if parent != nil{
            parent!.displayMessage(title: title, msg: msg, callback: callback)
            return
        }
        
        let alertView:UIAlertController!
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            alertView = UIAlertController(title: msg, message: title, preferredStyle: .alert)
        }
        else{
            alertView = UIAlertController(title: msg, message: title, preferredStyle: .actionSheet)
        }
        
        let alertAction = UIAlertAction(title: "ok", style: .cancel, handler: { _ in
            alertView.dismiss(animated: true, completion: nil)
            callback?()
        })
        alertView.addAction(alertAction)
        present(alertView, animated: true, completion: nil)
        
    }
    
}
var vSpinner : UIView?

extension UIViewController {
    func openAlertMessage(message: String){
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default)
        alertController.addAction(okay)
        present(alertController, animated: true)
    }
    
    func showSpinner_N(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner_N() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

