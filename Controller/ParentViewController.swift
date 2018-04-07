//
//  ParentViewController.swift
//  AcuDragon
//
//  Created by Emiko Clark on 4/7/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//
import UIKit

class ParentViewContoller: UIViewController {
    let childVC = HomeController2()
    @IBOutlet weak var currentStateView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiClient2.delegateCVC2 = self
        
        ApiClient2.fetchVideos2()
        
    }
    
//    func setView() {
//        self.addChildViewController(childVC!)
//        currentStateView.addSubview((childVC?.view)!)
//        childVC?.didMove(toParentViewController: self)
//    }
    
}

// MARK:- Delegate Methods

extension ParentViewContoller: loadCollectionVC2 {
    func loadCVC() {
        print(">>>>>>>>>>ready to load child VC into parent VC<<<<<<<<<<<<<<")
        
        setView()
    }
    
    func setView() {
        self.addChildViewController(self.childVC)
        self.currentStateView.addSubview((self.childVC.view))
        self.childVC.didMove(toParentViewController: self)
        
        print(">>>>>>>>>> loaded childVC  <<<<<<<<<<<<<<")

    }
}
