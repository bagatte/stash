//
//  UIViewController+Extensions.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

extension UIViewController {

	static func route<T: UIViewController>(_ viewController: T, presentationStyle: PresentationStyle) {
		switch presentationStyle {
		case .push(let navigationController):
			guard let navigationController = navigationController else {
				return
			}
			navigationController.pushViewController(viewController, animated: true)
		case .present(let presenter):
			presenter.present(viewController, animated: true, completion: nil)
		}
	}
}
