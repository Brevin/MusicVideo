//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Kelvin Kosgei on 09/06/2016.
//  Copyright © 2016 Kelvin Kosgei. All rights reserved.
//

import Foundation


class Videos {
    
    
    //Data Encapsulation
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    private var _vRights:String
    private var _vPrice:String
    private var _vArtist:String
    private var _vImId:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDate:String
    
    var vImageData:NSData?
    
    
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrice: String {
        return _vPrice
    }
    
    
    var vArtist: String {
        return _vArtist
    }
    
    var vImId: String {
        return _vImId
    }
    
    var vGenre: String {
        return _vGenre
    }
    
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    
    var vReleaseDate: String {
        return _vReleaseDate
    }
    
    
    
    init(data: JSONDictionary) {
        
        // Video Name
        
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
                self._vName = vName
        }
        else
        {
            //If JSON object is empty. Initialize it.
            
            _vName = " "
        }
        
        
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
            
                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
            
        }
        else
        {
            _vImageUrl = " "
        }
        
        
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
            
                self._vVideoUrl = vVideoUrl
        }
        else
        {
            _vVideoUrl = " "
        }
        
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String {
            
            self._vRights = vRights
        }
        else
        {
            _vRights = " "
        }
        
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String {
            
            self._vPrice = vPrice
        }
        else
        {
            _vPrice = " "
        }
        
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String {
            
            self._vArtist = vArtist
        }
        else
        {
            _vArtist = " "
        }
        
        
        if let imId = data["id"] as? JSONDictionary,
            vId = imId["attributes"] as? JSONDictionary,
            vVideoId = vId["im:id"] as? String {
            
            self._vImId = vVideoId
        }
        else
        {
            _vImId = " "
        }
        
        
        if let genre = data["category"] as? JSONDictionary,
            vCategory = genre["attributes"] as? JSONDictionary,
            vVideoGenre = vCategory["label"] as? String {
            self._vGenre = vVideoGenre
        }
        else
        {
            _vGenre = " "
        }
    
    
        if let linkToItunes = data["link"] as? JSONArray,
            vUrl = linkToItunes[0] as? JSONDictionary,
            vLinkHref = vUrl["attributes"] as? JSONDictionary,
            vLinkUrl = vLinkHref["href"] as? String {
            
            self._vLinkToiTunes = vLinkUrl
        }
        else
        {
            _vLinkToiTunes = " "
        }
        
        
        if let videoReleaseDate = data["im:releaseDate"] as? JSONDictionary,
            vRelDate = videoReleaseDate["attributes"] as? JSONDictionary,
            vVideoRelDate = vRelDate["label"] as? String {
            
            self._vReleaseDate = vVideoRelDate
        }
        else
        {
           _vReleaseDate = " "
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    

    
    
}