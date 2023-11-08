//
//  CacheManager.swift
//  YouTube-App
//
//  Created by Sihan on 9/11/23.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?){
        //Store the image in cache
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        return cache[url]
    }
}
