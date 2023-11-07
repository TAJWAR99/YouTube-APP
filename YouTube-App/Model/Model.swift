//
//  Model.swift
//  YouTube-App
//
//  Created by Sihan on 5/11/23.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos() {
        //create URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        //get URL session object
        let session = URLSession.shared
        //get a datatask from URL session object
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            //check for errors
            if error != nil || data == nil{
                return
            }
            do {
                //parsing the into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil{
                //call the videoReturned method of the delegate
                    DispatchQueue.main.async { //to throw from the background thread to tableview
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                }
                
                dump(response)
            } catch{
                
            }
            
        }
        //kickoff the task
        datatask.resume()
    }
}
