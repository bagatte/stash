//
//  UIAlertController+Extensions.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

extension UIAlertController {

	static func displayAlert(withError error: Error, in viewController: UIViewController) {
		let errorMessage: String
		if let utilityError = error as? UtilityError {
			errorMessage = utilityError.localizedDescription
		} else {
			errorMessage = error.localizedDescription
		}

		let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
		viewController.present(alert, animated: true, completion: nil)
	}
}
