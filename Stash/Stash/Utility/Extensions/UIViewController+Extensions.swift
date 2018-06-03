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
			if presenter is UINavigationController {
				presenter.present(viewController, animated: true, completion: nil)
			} else {
				let navigationController = UINavigationController(rootViewController: viewController)
				viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
																	target: nil,
																	action: #selector(doneButtonTapped))
				presenter.present(navigationController, animated: true, completion: nil)
			}
		}
	}

	@objc private func doneButtonTapped() {
		presentingViewController?.dismiss(animated: true, completion: nil)
	}
}
