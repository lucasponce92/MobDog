//
//  CustomImageView.swift
//  MobDog
//
//  Created by Lucas Ponce on 18-12-21.
//

import UIKit

let imgCache = NSCache<AnyObject, AnyObject>()

class CustomImageView : UIImageView{
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String){
        
        imageUrlString = urlString
        
        let url = NSURL(string: urlString)
        
        // para que la imagen se vea blanca antes de cargar
        image = UIImage(named: "loading")
        
        if let imageFromCache = imgCache.object(forKey: urlString as AnyObject) as? UIImage{
            
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url! as URL, completionHandler:
            
            {(data, responses, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async(execute: {
                    
                    let imageToCache = UIImage(data:data!)
                    
                    if self.imageUrlString == urlString{
                        self.image = imageToCache
                    }
                    
                    imgCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                })
        }).resume()
    }
}
