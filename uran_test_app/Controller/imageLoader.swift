//
//  imageLoader.swift
//  uran_test_app
//
//  Created by George Heints on 07.03.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import Foundation

//required App Transport Security Settings
extension UIImageView{
    func downloadImg(from url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil{
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
