//
//  CustomTabbarViewController.swift
//  facebook
//
//  Created by Namlv on 16/08/2023.
//

import UIKit

class CustomTabbarViewController: UIViewController, StoryboardInstantiable {
    
    var homeTab : UINavigationController?
    var friendTab : UINavigationController?
    var notiTab : UINavigationController?
    var profileTab : UINavigationController?

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        openHome()
    }
    @IBAction func onClickTabbar(_ sender: UIButton) {
        let tag = sender.tag
        switch tag {
        case 1:
            openFriend()
        case 2 :
           openNoti()
        case 3 :
            openProfile()
        default:
           openHome()
        }
        
    }
    
    func openHome () {
        if homeTab == nil {
            let homeView = HomeViewController.instantiateViewController();
            homeTab = UINavigationController(rootViewController: homeView);
        }
        contentView.addSubview(homeTab!.view)
        addChild(homeTab!)
        homeTab!.didMove(toParent: self)
    }
    func openFriend () {
        if friendTab == nil {
            let friendView = FriendTabViewController.instantiateViewController();
            friendTab = UINavigationController(rootViewController: friendView);
        }
        contentView.addSubview(friendTab!.view)
        addChild(friendTab!)
        friendTab!.didMove(toParent: self)
    }
    
    func openNoti () {
        if notiTab == nil {
            let notiView = NotificationTabViewController.instantiateViewController();
            notiTab = UINavigationController(rootViewController: notiView);
        }
        contentView.addSubview(notiTab!.view)
        addChild(notiTab!)
        notiTab!.didMove(toParent: self)
    }
    
    func openProfile () {
        if profileTab == nil {
            let profileView = ProfileViewController.instantiateViewController();
            profileTab = UINavigationController(rootViewController: profileView);
        }
        contentView.addSubview(profileTab!.view)
        addChild(profileTab!)
        profileTab!.didMove(toParent: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
