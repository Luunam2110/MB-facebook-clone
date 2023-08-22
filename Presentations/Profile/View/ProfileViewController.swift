//
//  ProfileViewController.swift
//  facebook
//
//  Created by Namlv on 06/08/2023.
//


import UIKit

class ProfileViewController: UIViewController , StoryboardInstantiable {


    @IBOutlet weak var btnChangePass: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView();
        // Do any additional setup after loading the view.
    }
    

    
    func initView(){
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
        btnChangePass.addTarget(self, action: #selector(changePassword), for: .touchUpInside)
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        let changePassScreen = ChangePasswordViewController.instantiateViewController()
        self.parent?.navigationController?.pushViewController(changePassScreen , animated: true);
    }
    @objc func changePassword(){
        let changePassScreen = ChangePasswordViewController.instantiateViewController()
        self.navigationController?.pushViewController(changePassScreen , animated: true)
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

