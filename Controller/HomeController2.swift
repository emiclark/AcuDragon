//
//  ViewController.swift
//  AcuDragon
//
//  Created by Emiko Clark on 1/22/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiClient2.delegate = self
        
//        ApiClient.fetchVideos2()
        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
        setupViewController()
    }
    
    // MARK:- ViewController Setup Methods

    func setupViewController() {
        // Register cell
//        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
        
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
    
    // MARK:- CollectionView Delegate Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
        DispatchQueue.main.async {
            cell.videoItem = ApiClient.videosArray.items![indexPath.row]
        }
        
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

// MARK:- reloadData Delegate
extension HomeController : reloadDataDelegate {
    func updateUI() {
        self.collectionView?.reloadData()
    }
}
//============== backup
//class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    var videos = Video()
//    let apiClient = ApiClient()
//
//    //    var videoItems: [Items] = {
//    //        let videos = [Items]()
//    //        return videos
//    //    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        apiClient.delegate = self
//        self.apiClient.fetchVideos2()
//        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
//        setupViewController()
//    }
//
//    // MARK:- ViewController Setup Methods
//
//    func setupViewController() {
//        // Register cell
//        //        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
//
//        // adjust collectionview and scrollview to begin below menubar
//        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
//        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
//
//        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
//
//        let navTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//        navTitleLabel.text = "Home"
//        navTitleLabel.font = UIFont.systemFont(ofSize: 20)
//        navTitleLabel.textColor = UIColor.white
//        navigationItem.titleView = navTitleLabel
//        collectionView?.backgroundColor = UIColor.white
//
//        // add search to navbar
//        let searchIcon = UIImage(named:"searchIcon")?.withRenderingMode(.alwaysOriginal)
//        let searchBarButtonItem = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(handleSearch))
//
//        // add more to navbar
//        let moreIcon = UIImage(named:"moreIcon")?.withRenderingMode(.alwaysOriginal)
//        let moreBarButtonItem = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(handleMore))
//        navigationItem.rightBarButtonItems = [ moreBarButtonItem, searchBarButtonItem ]
//        setupMenuBar()
//    }
//
//    @objc func handleSearch() {
//        print("123")
//    }
//
//    @objc func handleMore() {
//        print("234")
//    }
//
//    let menuBar: MenuBar = {
//        let mb = MenuBar()
//        return mb
//    }()
//
//    private func setupMenuBar() {
//        view.addSubview(menuBar)
//        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
//        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
//    }
//
//    // MARK:- CollectionView Delegate Methods
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
//        DispatchQueue.main.async {
//            cell.videoItem = self.apiClient.videosArray.items![indexPath.row]
//        }
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        //     FIX:    calculate all object height+ vertical padding
//        //        let cell = videos[indexPath.row]
//        //        let height = (view.frame.width - 16 - 16) * 9 / 16
//
//        let height = (view.frame.width - 16 - 16) * 9 / 16
//        return CGSize(width: view.frame.width, height: height + 16 + 68)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
//
//// MARK:- reloadData Delegate
//extension HomeController : reloadDataDelegate {
//    func updateUI() {
//        self.collectionView?.reloadData()
//    }
//}

//===============
//class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    var videos = Video()
//
//    var videoItems: [Items] = {
//        let videos = [Items]()
//        return videos
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupViewController()
//
//        ApiClient.fetchVideos2()
//    }
//
//    //    ApiClient.fetchVideos { (videoObject) in
//    //        DispatchQueue.main.async {
//    //            self.videos = videoObject
//    //            self.collectionView?.reloadData()
//    //        }
//    //    }
//
//}
////        // Register cell
////        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
////
////        // adjust collectionview and scrollview to begin below menubar
////        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
////        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
////
////        navigationController?.navigationBar.isTranslucent = false
////        navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
////
////        let navTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
////        navTitleLabel.text = "Home"
////        navTitleLabel.font = UIFont.systemFont(ofSize: 20)
////        navTitleLabel.textColor = UIColor.white
////        navigationItem.titleView = navTitleLabel
////        collectionView?.backgroundColor = UIColor.white
////
////        // add search to navbar
////        let searchIcon = UIImage(named:"searchIcon")?.withRenderingMode(.alwaysOriginal)
////        let searchBarButtonItem = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(handleSearch))
////
////        // add more to navbar
////        let moreIcon = UIImage(named:"moreIcon")?.withRenderingMode(.alwaysOriginal)
////        let moreBarButtonItem = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(handleMore))
////        navigationItem.rightBarButtonItems = [ moreBarButtonItem, searchBarButtonItem ]
////        setupMenuBar()
////    }
//
//func setupViewController() {
//    // Register cell
//    self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
//
//    // adjust collectionview and scrollview to begin below menubar
//    collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
//    collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
//
//    navigationController?.navigationBar.isTranslucent = false
//    navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
//
//    let navTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//    navTitleLabel.text = "Home"
//    navTitleLabel.font = UIFont.systemFont(ofSize: 20)
//    navTitleLabel.textColor = UIColor.white
//    navigationItem.titleView = navTitleLabel
//    collectionView?.backgroundColor = UIColor.white
//
//    // add search to navbar
//    let searchIcon = UIImage(named:"searchIcon")?.withRenderingMode(.alwaysOriginal)
//    let searchBarButtonItem = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(handleSearch))
//
//    // add more to navbar
//    let moreIcon = UIImage(named:"moreIcon")?.withRenderingMode(.alwaysOriginal)
//    let moreBarButtonItem = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(handleMore))
//    navigationItem.rightBarButtonItems = [ moreBarButtonItem, searchBarButtonItem ]
//    setupMenuBar()
//}
//
//@objc func handleSearch() {
//    print("123")
//}
//
//@objc func handleMore() {
//    print("234")
//}
//
//let menuBar: MenuBar = {
//    let mb = MenuBar()
//    return mb
//}()
//
//private func setupMenuBar() {
//    view.addSubview(menuBar)
//    view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
//    view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
//}
//
//override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return 1
//}
//
//override func numberOfSections(in collectionView: UICollectionView) -> Int {
//    return 1
//}
//
//override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
//
//    cell.videoItem = videos.items![indexPath.row]
//
//    //        cell.thumbnailImageView.image = ApiClient.downloadImage(urlString: urlString, completion: { (videoThumbnail) in
//    //
//    //            DispatchQueue.main.async {
//    //                cell.thumbnailImageView.image = videoThumbnail
//    //                self.collectionView?.reloadData()
//    //            }
//    //        })
//
//
//    return cell
//}
//
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    //     FIX:    calculate all object height+ vertical padding
//    //        let cell = videos[indexPath.row]
//    //        let height = (view.frame.width - 16 - 16) * 9 / 16
//
//    let height = (view.frame.width - 16 - 16) * 9 / 16
//    return CGSize(width: view.frame.width, height: height + 16 + 68)
//}
//
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    return 0
//}
//}
//
//extension HomeController : reloadDataDelegate {
//    func updateUI() {
//        self.collectionView?.reloadData()
//    }
//}
//===============

//    func fetchVideos() {
//        var videoItemsArr = [Items]()
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
//
//                self.videos.etag = etag
//                for vid in itemsArray {
//                    videoItemsArr.append(vid)
//                }
//                self.videos.items?.append(contentsOf: videoItemsArr)
//
//                print(videoItemsArr)
//
//                DispatchQueue.main.async() {
//                    self.collectionView?.reloadData()
//                }
//            } catch let error {
//                print(error)
//            }
//            }.resume()
//    }


//================
////
////  ViewController.swift
////  AcuDragon
////
////  Created by Emiko Clark on 1/22/18.
////  Copyright © 2018 Emiko Clark. All rights reserved.
////
//
//import UIKit
//
//class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    let myAPIKey = "AIzaSyDmqaPH8yJO7uMfTUXz9AKxP5zdb79ym0Q"
//    let myECChannel = "UCD5kT8GTKnbYl9WxgnLM0aA"
//    var videosArr = [Video]()
//
//    /* ec channel response ============
//     https://www.googleapis.com/youtube/v3/search?key=AIzaSyDmqaPH8yJO7uMfTUXz9AKxP5zdb79ym0Q&channelId=UCD5kT8GTKnbYl9WxgnLM0aA&part=snippet&maxResults=20
//
//     // returns playlist for ec channel 50 items
//     https://www.googleapis.com/youtube/v3/playlistItems?playlistId=UUD5kT8GTKnbYl9WxgnLM0aA&key=AIzaSyCz7ChsZALe88gbZuQyexQY82oQ1de6qZU&part=snippet&maxResults=50
//
//     ==================================
//     */
//
//    //    var videos: [Video] = {
//    //        let videoArr = [Video]()
//    //        return videoArr
//    //    }()
//
//
//    func fetchVideos() {
//        //        let requestString = "https://www.googleapis.com/youtube/v3/playlistItems&key=\(myAPIKey)&part=snippet&list=PLC695C1E9DEE1C218"
//        //        let urlString =  "https://www.googleapis.com/youtube/v3/videos?id=7lCDEYXw3mM&key=\(myAPIKey)&part=snippet,contentDetails,statistics,status"
//        //        let url = URL(string: urlString)
//
//        // old test url from Brian Voon tutorial
//        // let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
//
//
//        let requestString = "https://www.googleapis.com/youtube/v3/search?key=\(myAPIKey)&channelId=UCD5kT8GTKnbYl9WxgnLM0aA&part=snippet,id"
//        let url =  URL(string: requestString)
//
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if error != nil {
//                print(error!)
//                return
//            }
//            guard let data  = data else { return }
//
//            do {
//                let json = try JSONDecoder().decode([Video].self, from: data)
//                self.videosArr = json
//                print(self.videosArr)
//
//                //                guard let items = json["items"],
//                //                    let snippet = items["snippet"],
//                //                    let snippetDescription = snippet["description"],
//                //                    let snippetTitle = snippet["title"],
//                //                    let thumbnails = snippet["thumbnails"],
//                //                    let thumbnailUrlString = thumbnails["default"]
//                //                    else { return }
//
//                //                let video = Video()
//                //                video.thumbnails = thumbnails
//                //                video.title = snippetTitle
//                //                video.descript = snippetDescription
//                //                self.videosArr.append(video)
//
//                //                var channel
//                //                var title: String?
//                //                var videoDescription: String?
//                //                var resourceId: ResourceID?
//
//
//
//                DispatchQueue.main.async() {
//                    self.collectionView?.reloadData()
//                }
//            } catch let error {
//                print(error)
//            }
//            }.resume()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        fetchVideos()
//
//        // Register cell
//        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
//
//        // adjust collectionview and scrollview to begin below menubar
//        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
//        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
//
//        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
//
//        let navTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//        navTitleLabel.text = "Home"
//        navTitleLabel.font = UIFont.systemFont(ofSize: 20)
//        navTitleLabel.textColor = UIColor.white
//        navigationItem.titleView = navTitleLabel
//        collectionView?.backgroundColor = UIColor.white
//
//        // add search to navbar
//        let searchIcon = UIImage(named:"searchIcon")?.withRenderingMode(.alwaysOriginal)
//        let searchBarButtonItem = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(handleSearch))
//
//        // add more to navbar
//        let moreIcon = UIImage(named:"moreIcon")?.withRenderingMode(.alwaysOriginal)
//        let moreBarButtonItem = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(handleMore))
//        navigationItem.rightBarButtonItems = [ moreBarButtonItem, searchBarButtonItem ]
//        setupMenuBar()
//    }
//
//    @objc func handleSearch() {
//        print("123")
//    }
//
//    @objc func handleMore() {
//        print("234")
//    }
//
//    let menuBar: MenuBar = {
//        let mb = MenuBar()
//        return mb
//    }()
//
//    private func setupMenuBar() {
//        view.addSubview(menuBar)
//        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
//        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return videosArr.count
//    }
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
//
//        cell.video = (videosArr[indexPath.row])
//
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        //     FIX:    calculate all object height+ vertical padding
//        //        let cell = videos[indexPath.row]
//        //        let height = (view.frame.width - 16 - 16) * 9 / 16
//
//        let height = (view.frame.width - 16 - 16) * 9 / 16
//        return CGSize(width: view.frame.width, height: height + 16 + 68)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
//

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

//=================== below with google signIn code ==================
////
////  ViewController.swift
////  AcuDragon
////
////  Created by Emiko Clark on 1/22/18.
////  Copyright © 2018 Emiko Clark. All rights reserved.
////
//
//import UIKit
//import GoogleSignIn
//
//class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, GIDSignInUIDelegate {
//    //    @IBOutlet weak var signInButton:  GIDSignInButton!
//    //    @IBOutlet weak var signOutButton: GIDSignOutButton!
//
//    var videos: [Video] = {
//        let videoArr = [Video]()
//        return videoArr
//    }()
//
//    func fetchVideos() {
//        let myAPIKey = "AIzaSyDmqaPH8yJO7uMfTUXz9AKxP5zdb79ym0Q"
//        let urlString =  "https://www.googleapis.com/youtube/v3/videos?id=7lCDEYXw3mM&key=\(myAPIKey)&part=snippet,contentDetails,statistics,status"
//        let url = URL(string: urlString)
//
//        // old test url from Brian Voon tutorial
//        // let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
//
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if error != nil {
//                print(error!)
//                return
//            }
//            guard let data  = data else { return }
//
//            do {
//                let json = try JSONDecoder().decode([Video].self, from: data)
//                self.videos = json
//                print(self.videos)
//
//                DispatchQueue.main.async() {
//                    self.collectionView?.reloadData()
//                }
//            } catch let error {
//                print(error)
//            }
//            }.resume()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //        GIDSignIn.sharedInstance().uiDelegate = self
//        //
//        //        // Uncomment to automatically sign in the user.
//        //        GIDSignIn.sharedInstance().signInSilently()
//        //
//        //        // TODO(developer) Configure the sign-in button look/feel
//        //        // ...
//
//        fetchVideos()
//
//        // Register cell
//        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
//
//        // adjust collectionview and scrollview to begin below menubar
//        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
//        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
//
//        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
//
//        let navTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//        navTitleLabel.text = "Home"
//        navTitleLabel.font = UIFont.systemFont(ofSize: 20)
//        navTitleLabel.textColor = UIColor.white
//        navigationItem.titleView = navTitleLabel
//        collectionView?.backgroundColor = UIColor.white
//
//        // add search to navbar
//        let searchIcon = UIImage(named:"searchIcon")?.withRenderingMode(.alwaysOriginal)
//        let searchBarButtonItem = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(handleSearch))
//
//        // add more to navbar
//        let moreIcon = UIImage(named:"moreIcon")?.withRenderingMode(.alwaysOriginal)
//        let moreBarButtonItem = UIBarButtonItem(image: moreIcon, style: .plain, target: self, action: #selector(handleMore))
//        navigationItem.rightBarButtonItems = [ moreBarButtonItem, searchBarButtonItem ]
//        setupMenuBar()
//    }
//
//    //    @IBAction func didTapSignIn(_ sender: AnyObject) {
//    //        GIDSignIn.sharedInstance().signIn()
//    //    }
//    //
//    //    @IBAction func didTapSignOut(_ sender: AnyObject) {
//    //        GIDSignIn.sharedInstance().signOut()
//    //    }
//
//    //    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//    //        if let error = error {
//    //            print("\(error.localizedDescription)")
//    //        }
//    //    }
//
//    //    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//    //        if let error = error {
//    //            print("\(error.localizedDescription)")
//    //        } else {
//    //            // Perform any operations on signed in user here.
//    //            let userId = user.userID                  // For client-side use only!
//    //            let idToken = user.authentication.idToken // Safe to send to the server
//    //            let fullName = user.profile.name
//    //            let givenName = user.profile.givenName
//    //            let familyName = user.profile.familyName
//    //            let email = user.profile.email
//    //            // ...
//    //        }
//    //    }
//
//    @objc func handleSearch() {
//        print("123")
//    }
//
//    @objc func handleMore() {
//        print("234")
//    }
//
//    let menuBar: MenuBar = {
//        let mb = MenuBar()
//        return mb
//    }()
//
//    private func setupMenuBar() {
//        view.addSubview(menuBar)
//        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
//        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return videos.count
//    }
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
//
//        cell.video = (videos[indexPath.row])
//
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        //     FIX:    calculate all object height+ vertical padding
//        //        let cell = videos[indexPath.row]
//        //        let height = (view.frame.width - 16 - 16) * 9 / 16
//
//        let height = (view.frame.width - 16 - 16) * 9 / 16
//        return CGSize(width: view.frame.width, height: height + 16 + 68)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
//
//
////================
////    struct courses_missing_fields: Decodable {
////        let name: String?
////        let description: String?
////        let courses: [Course]?
////    }
////
////    struct Course: Decodable {
////        let id: Int?
////        let name: String?
////        let link: String?
////        let imageUrl: String?
////
////    }
//
//// test api
////        let url = URL(string: "http://api.letsbuildthatapp.com/jsondecodable/courses")
////
////        URLSession.shared.dataTask(with: url!) { (data, response, err) in
////            if err != nil {
////                print(err!)
////                return
////            }
////
////            guard let data = data else { return }
////
////            do {
////               let courses = try JSONDecoder().decode([Course].self, from: data)
////                print(courses)
////            }catch  {
////
////            }
////
//////             swift 3
//////            do {
//////                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)  as? [String : Any] else { return }
//////
//////                let course = Course(json: json)
//////                print(course)
//////
//////
//////            } catch let jsonErr {
//////                print("Error with json serialization: \(jsonErr)")
//////            }
//////
////        }.resume()
//
//// parsing more complex json objects using decodable
////let url2 = URL(string: "http://api.letsbuildthatapp.com/jsondecodable/website_description")
////
////let url3 = URL(string: "http://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields")
////
////
////URLSession.shared.dataTask(with: url3!) { (data, response, error) in
////    if error != nil {
////        print(error!)
////        return
////    }
////
////    guard let data = data else { return }
////    do {
////        let missing_fields = try JSONDecoder().decode(courses_missing_fields.self, from: data)
////        print(missing_fields)
////    } catch {
////
////    }
////
////    }.resume()
////
//
///=====================
//                guard let items = json["items"],
//                    let snippet = items["snippet"],
//                    let snippetDescription = snippet["description"],
//                    let snippetTitle = snippet["title"],
//                    let thumbnails = snippet["thumbnails"],
//                    let thumbnailUrlString = thumbnails["default"]
//                    else { return }
//
//                let video = Video()
//                video.thumbnails = thumbnails
//                video.title = snippetTitle
//                video.descript = snippetDescription
//                self.videosArr.append(video)
//
//                var channel
//                var title: String?
//                var videoDescription: String?
//                var resourceId: ResourceID?


