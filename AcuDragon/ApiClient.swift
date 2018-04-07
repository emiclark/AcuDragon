//
//  ApiClient.swift
//  AcuDragon
//
//  Created by Emiko Clark on 4/5/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class ApiClient {
    
    class func fetchVideos( completion: @escaping(Video)->() ) {
        var videoObject = Video()
        var videoItemsArr = [Items]()
        var videoSnippet  = Snippet()
        
        let requestString = "https://www.googleapis.com/youtube/v3/search?key=\(Constants.myAPIKey)&channelId=\(Constants.myECChannel)&part=snippet,id"
        let urlRequest =  URL(string: requestString)
        
        URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let data  = data else { return }
            
            print(data.description)
            
            do {
                let json = try JSONDecoder().decode(Video.self, from: data)
                
                guard let etag = json.etag else { print("mainJson etag nil"); return }
                guard let itemsArray = json.items else { print("error creating json"); return }
                videoObject.etag = etag
                
                for vid in itemsArray {
                    videoItemsArr.append(vid)
                }
                
                videoObject.items?.append(contentsOf: videoItemsArr)
                
                DispatchQueue.main.async() {
                    completion(videoObject)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    
    class func downloadImage(urlString: String, completion: @escaping(UIImage)->()) {
        print("OK")
    }
    
}
