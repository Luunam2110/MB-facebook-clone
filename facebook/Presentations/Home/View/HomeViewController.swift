//
//  HomeViewController.swift
//  facebook
//
//  Created by Namlv on 06/08/2023.
//

import UIKit

class HomeViewController: UIViewController, StoryboardInstantiable {

    @IBOutlet weak var btnLogout: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    
    func initView(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        btnLogout.addTarget(self, action: #selector(logout), for: .touchUpInside)
    }
    
    @objc func logout() {
        let _ = KeychainManager.shared.deleteToken()
        UserDefaultsManager.shared.removeUser()
        AppState.shared.isAuthorited.value = false
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
