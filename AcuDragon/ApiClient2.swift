//
//  ApiClient2.swift
//  AcuDragon
//
//  Created by Emiko Clark on 4/7/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

protocol reloadDataDelegate2 {
    func updateUI()
}

protocol loadCollectionVC2 {
    func loadCVC()
}
class ApiClient2 {
    
    static var videosArray = Video()
    static var delegate2: reloadDataDelegate2?
    static var delegateCVC2: loadCollectionVC2?
    
    class func fetchVideos2() {
        
        let requestString = "https://www.googleapis.com/youtube/v3/search?key=\(Constants.myAPIKey)&channelId=\(Constants.myECChannel)&part=snippet,id"
        let urlRequest =  URL(string: requestString)
        
        URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let data  = data else { return }
            
            do {
                videosArray = try JSONDecoder().decode(Video.self, from: data)

                ApiClient2.delegateCVC2?.loadCVC()
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
