//
//  ViewController.swift
//  AcuDragon
//
//  Created by Emiko Clark on 1/22/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var videos: [Video] = {
        let videoArr = [Video]()
        return videoArr
    }()

    func fetchVideos() {
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let data  = data else { return }

            do {
                let json = try JSONDecoder().decode([Video].self, from: data)
                self.videos = json
                print(self.videos)
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        // Register cell
        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
        
        // adjust collectionview and scrollview to begin below menubar
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        
        let navTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        navTitleLabel.text = "Home"
        navTitleLabel.font = UIFont.systemFont(ofSize: 20)
        navTitleLabel.textColor = UIColor.white
        navigationItem.titleView = navTitleLabel
        collectionView?.backgroundColor = UIColor.white
        
        // add search to navbar
        let searchIcon = UIImage(named:"searchIcon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(handleSearch))
        
        // add more to navbar
        let moreIcon = UIImage(named:"moreIcon")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [ moreBarButtonItem, searchBarButtonItem ]
        setupMenuBar()
    }
    
    @objc func handleSearch() {
        print("123")
    }
    
    @objc func handleMore() {
        print("234")
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()

    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
        
        cell.video = (videos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//     FIX:    calculate all object height+ vertical padding
//        let cell = videos[indexPath.row]
//        let height = (view.frame.width - 16 - 16) * 9 / 16
        
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


//================
//    struct courses_missing_fields: Decodable {
//        let name: String?
//        let description: String?
//        let courses: [Course]?
//    }
//
//    struct Course: Decodable {
//        let id: Int?
//        let name: String?
//        let link: String?
//        let imageUrl: String?
//
//    }

// test api
//        let url = URL(string: "http://api.letsbuildthatapp.com/jsondecodable/courses")
//
//        URLSession.shared.dataTask(with: url!) { (data, response, err) in
//            if err != nil {
//                print(err!)
//                return
//            }
//
//            guard let data = data else { return }
//
//            do {
//               let courses = try JSONDecoder().decode([Course].self, from: data)
//                print(courses)
//            }catch  {
//
//            }
//
////             swift 3
////            do {
////                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)  as? [String : Any] else { return }
////
////                let course = Course(json: json)
////                print(course)
////
////
////            } catch let jsonErr {
////                print("Error with json serialization: \(jsonErr)")
////            }
////
//        }.resume()

// parsing more complex json objects using decodable
//let url2 = URL(string: "http://api.letsbuildthatapp.com/jsondecodable/website_description")
//
//let url3 = URL(string: "http://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields")
//
//
//URLSession.shared.dataTask(with: url3!) { (data, response, error) in
//    if error != nil {
//        print(error!)
//        return
//    }
//
//    guard let data = data else { return }
//    do {
//        let missing_fields = try JSONDecoder().decode(courses_missing_fields.self, from: data)
//        print(missing_fields)
//    } catch {
//
//    }
//
//    }.resume()
//

