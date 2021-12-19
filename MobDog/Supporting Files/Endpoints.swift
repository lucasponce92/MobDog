//
//  Endpoints.swift
//  Tienda Virtual
//
//  Created by Lucas Ponce on 7/28/20.
//  Copyright © 2020 Lucas Ponce. All rights reserved.
//

import Foundation

class Endpoints {
    
    static var urlPath = "https://dog.ceo/api/"
    
    class func getEndpointBreeds(name:String?) -> String {
        
        if name != nil {
            return "\(urlPath)breed/\(name!)/images"
        }else{
            return "\(urlPath)breeds/list"
        }
    }
}
