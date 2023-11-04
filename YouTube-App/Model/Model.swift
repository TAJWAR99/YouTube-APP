//
//  Model.swift
//  YouTube-App
//
//  Created by Sihan on 5/11/23.
//

import Foundation


class Model {
    func getVideos() {
        //create URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        //get URL session object
        let session = URLSession.shared
        //get a datatask from URL session object
        let datatask = session.dataTask(with: url!) { data, response, error in
            //check for errors
            if error != nil || data == nil{
                return
            }
        }
    }
}
