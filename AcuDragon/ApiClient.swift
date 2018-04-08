//
//  ApiClient.swift
//  AcuDragon
//
//  Created by Emiko Clark on 4/5/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

protocol reloadDataDelegate {
    func updateUI()
}

class ApiClient {
    
    static var videosArray = Video()
    var delegate: reloadDataDelegate?

    func fetchVideos2(pageNum: Int) {
            
        let urlString = "\(Constants.baseUrlString)\(Constants.myAPIKey)&channelId=\(Constants.myECChannel)&part=snippet,id"
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        getVideos(urlRequest: urlRequest, completion: { (Video) in
            ApiClient.videosArray = Video
            
            DispatchQueue.main.async() {
                self.delegate?.updateUI()
            }
        })
    }
    
    func getVideos(urlRequest: URLRequest, completion: @escaping (_ jsonArr: Video) -> ()) {
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let data  = data else { return }
            
            do {
                ApiClient.videosArray = try JSONDecoder().decode(Video.self, from: data)
                completion(ApiClient.videosArray)

            } catch let error {
                print(error)
            }
        }.resume()
    }

    class func downloadImage(urlString: String, completion: @escaping(UIImage)->()) {
        print("OK")
    }
}
    
//===============
//    var videosArray = Video()
//    var delegate: reloadDataDelegate?
//
//    func fetchVideos2(pageNum: Int) {
//
//        let requestString = "\(Constants.baseUrlString)\(Constants.myAPIKey)&channelId=\(Constants.myECChannel)&part=snippet,id"
//        let urlRequest =  URL(string: requestString)
//
//        getVideos(urlRequest: urlRequest, completion: {(jsonData)
//
//        })
//        URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
//
//            if error != nil {
//                print(error!)
//                return
//            }
//
//            guard let data  = data else { return }
//
//            do {
//                self.videosArray = try JSONDecoder().decode(Video.self, from: data)
//
//                DispatchQueue.main.async() {
//                    self.delegate?.updateUI()
//                }
//            } catch let error {
//                print(error)
//            }
//            }.resume()
//    }
//
//===============
    
//    class func fetchVideos( completion: @escaping(Video)->() ) {
//        var delegate: reloadDataDelegate?
//        var videoObject = Video()
//        var videoItemsArr = [Items]()
//        var videoSnippet  = Snippet()
//        
//        let requestString = "https://www.googleapis.com/youtube/v3/search?key=\(Constants.myAPIKey)&channelId=\(Constants.myECChannel)&part=snippet,id"
//        let urlRequest =  URL(string: requestString)
//        
//        URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
//            if error != nil {
//                print(error!)
//                return
//            }
//            guard let data  = data else { return }
//            
//            print(data.description)
//            
//            do {
//                let json = try JSONDecoder().decode(Video.self, from: data)
//                
//                guard let etag = json.etag else { print("mainJson etag nil"); return }
//                guard let itemsArray = json.items else { print("error creating json"); return }
//                videoObject.etag = etag
//                
//                for vid in itemsArray {
//                    videoItemsArr.append(vid)
//                }
//                
//                videoObject.items?.append(contentsOf: videoItemsArr)
//                
//                DispatchQueue.main.async() {
//                    completion(videoObject)
//                }
//            } catch let error {
//                print(error)
//            }
//        }.resume()
//    }

