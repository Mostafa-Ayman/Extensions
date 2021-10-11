//
//  ViewController.swift
//  MyLoaderView
//
//  Created by Mostafa Ayman on 12/10/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showButtonPressed(_ sender: Any) {
        DispatchQueue.main.async { [weak self] in
            self?.animateLoaderView()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [ weak self] in
            self?.stopLoaderView()
        }
    }
    
 


}



extension UIViewController{
    var loaderView: LoaderView {
        let window = UIApplication.shared.windows.first!
        for view in window.subviews where view is LoaderView {
            return view as! LoaderView
        }
        for view in view.subviews where view is LoaderView {
            return view as! LoaderView
        }
        return LoaderView.instanceFromNib()
    }
    
    func animateLoaderView(overContext: Bool = false) {
        let handyLoader = loaderView
        if overContext == true {
            let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first!
            for view in window.subviews where view is LoaderView {
                return
            }
            handyLoader.frame = window.frame
            window.addSubview(handyLoader)
        } else {
            for view in view.subviews where view is LoaderView {
                return
            }
            handyLoader.frame = view.bounds
            view.addSubview(handyLoader)
        }
    }

    func stopLoaderView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.loaderView.alpha = 0
        }, completion: { _ in
            self.loaderView.removeFromSuperview()
        })
    }

}

