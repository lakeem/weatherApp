//
//  WeatherCellView.swift
//  WeatherApp
//
//  Created by lakeem muhammad on 5/20/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import UIKit


struct WeatherCellVM{
    
    let url: URL
    let day : String
    let description : String
    
    func loadImage(completion: @escaping (UIImage? )-> Void ){
        
        guard let imageData = try? Data(contentsOf: url) else {return}
        
        let image = UIImage(data: imageData)
        DispatchQueue.main.async {
            //update the view with down loaded image.
            //TODO: add a cache to deal with some of this.
            completion(image)
        }
    }
    
}


