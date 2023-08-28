import UIKit

class LoadingView {

    internal static var spinner: UIActivityIndicatorView?

    static func show() {
        DispatchQueue.main.async {
            NotificationCenter.default.addObserver(self, selector: #selector(update), name: UIDevice.orientationDidChangeNotification, object: nil)
            if spinner == nil,  let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                let window = sceneDelegate.window
                let frame = UIScreen.main.bounds
                let spinner = UIActivityIndicatorView(frame: frame)
                spinner.backgroundColor = UIColor.black.withAlphaComponent(0.2)
                spinner.style = .medium
                window?.addSubview(spinner)

                spinner.startAnimating()
                self.spinner = spinner
            }
//            if spinner == nil,  let windowScene =  UIApplication.shared.connectedScenes as? UIWindowScene , let sceneDelegate = windowScene.delegate as? SceneDelegate {
//                let window = sceneDelegate.window
//                let frame = UIScreen.main.bounds
//                let spinner = UIActivityIndicatorView(frame: frame)
//                spinner.backgroundColor = UIColor.black.withAlphaComponent(0.2)
//                spinner.style = .medium
//                window.addSubview(spinner)
//
//                spinner.startAnimating()
//                self.spinner = spinner
//            }
        }
    }

    static func hide() {
        DispatchQueue.main.async {
            guard let spinner = spinner else { return }
            spinner.stopAnimating()
            spinner.removeFromSuperview()
            self.spinner = nil
        }
    }

    @objc static func update() {
        DispatchQueue.main.async {
            if spinner != nil {
                hide()
                show()
            }
        }
    }
}
