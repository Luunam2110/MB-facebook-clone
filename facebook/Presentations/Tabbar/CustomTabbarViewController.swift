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
    
    
    var currentTab = 0;
    
    var leadingConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    @IBOutlet weak var selectedIndicator: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        openHome();
        initView();
        setSelectedTab(0);
    }
    @IBAction func onClickTabbar(_ sender: UIButton) {
        let tag = sender.tag
        print(tag)
        currentTab = tag;
        setSelectedTab(tag);
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
    func initView () {
        let width = (Float(selectedIndicator.frame.width));
        selectedIndicator.widthAnchor.constraint(equalToConstant: CGFloat(width )).isActive = true
        leadingConstraint = selectedIndicator.leadingAnchor.constraint(equalTo: tabView.leadingAnchor)
        leadingConstraint?.isActive = true
        let maskPath = UIBezierPath(
            roundedRect: selectedIndicator.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: CGFloat(2.5), height: CGFloat(2.5))
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        selectedIndicator.layer.mask = maskLayer
        selectedIndicator.layoutIfNeeded()
    }

    func setSelectedTab (_ tab : Int) {
        let width = (Float(tabView.frame.width) / 4)
        let indicatorWidth = (Float(selectedIndicator.frame.width))
        UIView.animate(withDuration: 0.2, delay: 0 , options: .curveLinear) {
            self.selectedIndicator.transform = CGAffineTransform(translationX: CGFloat(width * Float(tab) + (width - indicatorWidth) / 2 ), y: self.selectedIndicator.frame.minY)
            if let  imageView = self.view.viewWithTag(tab) as? UIImageView {
                imageView.tintColor = UIColor(named: "tabbarSelectedColor")
            }
            for i in 1...4 {
                if let imageView = self.view.viewWithTag(i) as? UIImageView {
                    imageView.tintColor = UIColor(named: i == tab + 1  ? "tabbarSelectedColor" : "tabbarColor")
                }
                
            }
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
