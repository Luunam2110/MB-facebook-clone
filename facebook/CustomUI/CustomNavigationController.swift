//
//  CustomNavigationController.swift
//  facebook
//
//  Created by Namlv on 06/08/2023.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpView()
        // Thêm gesture recognizer cho việc vuốt từ cạnh
        let edgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleEdgePanGesture(_:)))
        edgePanGesture.edges = .left // Vuốt từ cạnh trái
        view.addGestureRecognizer(edgePanGesture)
}
    
    @objc func handleEdgePanGesture(_ gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
            // Xử lý việc vuốt từ cạnh và thực hiện pop view controller khi cần
        if gestureRecognizer.state == .recognized {
            popViewController(animated: true)
            
        }
    }
}

//extension UINavigationController {
//
//    func showBack() {
//        navigationItem.backBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "chevron.backward"),
//            style: .plain,
//            target: self ,
//            action: #selector(backButton)
//        )
//        navigationItem.backBarButtonItem?.title = ""
//    }
//    
//    @objc func backButton (){
//        navigationBar.popItem(animated: true)
//    }
//    func setUpView(){
//        let appearence = UINavigationBarAppearance()
//        appearence.backgroundColor = UIColor(named: "tabbarColor")
//        appearence.titleTextAttributes =
//        [NSAttributedString.Key.foregroundColor : UIColor(named: "titleColor") ?? UIColor.black]
//        navigationBar.standardAppearance = appearence
//        navigationBar.scrollEdgeAppearance = appearence
//        navigationBar.standardAppearance = appearence
//        navigationBar.tintColor = UIColor(named: "titleColor")
//    }
//        
//}
//
