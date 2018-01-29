//
//  Video.swift
//  AcuDragon
//
//  Created by Emiko Clark on 1/25/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class Channel: NSObject, Decodable {
    var name: String?
    var profile_image_name: String?
}

class Video:  NSObject, Decodable {
    var thumbnail_image_name: String?
    var channel: Channel?
    var title: String?
    var subTitle: String?
}




