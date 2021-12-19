//
//  Spinner.swift
//  MobDog
//
//  Created by Lucas Ponce on 19-12-21.
//

import UIKit

var spinnerView : UIView?

extension UIViewController{
    
    func startLoading() {
        spinnerView = UIView(frame: self.view.bounds)
        spinnerView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let ai = UIActivityIndicatorView()
        
        if #available(iOS 13.0, *) {
            ai.style = .large
        }
        
        ai.center = spinnerView!.center
        ai.startAnimating()
        spinnerView?.addSubview(ai)
        self.view.addSubview(spinnerView!)
    }
    
    func endLoading(){
        spinnerView?.removeFromSuperview()
        spinnerView = nil
    }
    
    func showTast(message: String){
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.width/2-150, y: self.view.frame.height - 100, width: 300, height: 40))
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.darkGray
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 3
        toastLabel.clipsToBounds = true
        toastLabel.text = message
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseIn, animations: {
            toastLabel.alpha = 0.0
        }) { (completed) in
            toastLabel.removeFromSuperview()
        }
    }
}
