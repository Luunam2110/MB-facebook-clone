//
//  LoginViewController.swift
//  facebook
//
//  Created by Namlv on 06/08/2023.
//

import UIKit

class LoginViewController: UIViewController , StoryboardInstantiable {


    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfUserName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    

    func initView() {
        btnLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
       
    }
    
    @objc func login() {
        if !(tfUserName.text?.isEmpty ?? true) {
            let result = KeychainManager.shared.saveToken(tfUserName?.text ?? "")
            if result {
                let tabbar = CustomTabbarViewController.instantiateViewController();
                let homeNavigatorController = CustomNavigationController(rootViewController: tabbar)
                let scenes = UIApplication.shared.connectedScenes
                let windowScene = scenes.first as? UIWindowScene
                let window = windowScene?.windows.first
                window?.rootViewController = homeNavigatorController;
            }
        }
        
    }

}
