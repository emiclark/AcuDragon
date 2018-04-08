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
            
        let urlString = "\(Constants.baseUrlString)\(secret.myAPIKey)&channelId=\(secret.myECChannel)&part=snippet,id"
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
                dump(ApiClient.videosArray)
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

