//
//  BaseViewController.swift
//  NYNewsApp
//
//  Created by iLeafiMac on 23/01/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
extension BaseViewController {
     func showErrorAlert(with message: String) {

        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }

    }

     func handleError(_ error: HTTPError) {
        switch error {
        case .noInternet:
            showErrorAlert(with: "The internet connection is lost")
        case .invalidURL:
            showErrorAlert(with: "Unfortunately something went wrong")
        case .genericError:
            showErrorAlert(with:"Unfortunately something went wrong")
        }
    }

}
