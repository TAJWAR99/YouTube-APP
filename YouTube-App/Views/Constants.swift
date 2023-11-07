//
//  Constants.swift
//  YouTube-App
//
//  Created by Sihan on 5/11/23.
//

import Foundation

struct Constants{
    
    static var API_KEY = Secret()
    static var PLAYLIST_ID = PlayListID()
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
