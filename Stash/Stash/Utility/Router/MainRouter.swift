//
//  MainRouter.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

final class MainRouter {

	// MARK: - Private properties

	private let viewControllerBuilder: MainViewControllerBuilder

	// MARK: - Init

	init(viewControllerBuilder: MainViewControllerBuilder) {
		self.viewControllerBuilder = viewControllerBuilder
	}

	// MARK: - Public methods

	func routeToRootViewController() {
		guard
			let application = UIApplication.shared.delegate as? AppDelegate,
			let window = application.window else {
				return
		}

		let viewController = viewControllerBuilder.mainViewController()
		let navigationController = UINavigationController(rootViewController: viewController)
		navigationController.setNavigationBarHidden(true, animated: false)

		window.rootViewController = navigationController
		window.makeKeyAndVisible()
	}
}
