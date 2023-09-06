//
//  LoginViewController.swift
//  facebook
//
//  Created by Namlv on 06/08/2023.
//

import UIKit

class LoginViewController: UIViewController , StoryboardInstantiable {
    
    
    var viewModel: LoginViewModel?
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfUserName: UITextField!
    
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var tfPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LoginViewModel()
        initView()
    }
    
    
    func initView() {
        btnLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
        bind()
    }
    
    @objc func login() {
        if (!(tfUserName.text?.isEmpty ?? true) && !(tfPassword.text?.isEmpty ?? true)) {
            viewModel?.login(tfUserName.text!, tfPassword.text!)
            
        }
        
    }
    
    private func bind() {
        viewModel?.error.observe(on: self, observerBlock: { error in
            self.txtEmail.text = error
        })
        viewModel?.email.observe(on: self){ email in
            if email != "" {
                let tabbar = CustomTabbarViewController.instantiateViewController();
                let homeNavigatorController = CustomNavigationController(rootViewController: tabbar)
                let scenes = UIApplication.shared.connectedScenes
                let windowScene = scenes.first as? UIWindowScene
                let window = windowScene?.windows.first
                window?.rootViewController = homeNavigatorController;
            }
        }
    }
    
    deinit {
        viewModel?.error.remove(observer: self)
        viewModel?.email.remove(observer: self)
    }
    
}
