//
//  MainViewControllerBuilder.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct MainViewControllerBuilder {

	// MARK: - Private properties

	private let router: Router

	// MARK: - Init

	init(router: Router) {
		self.router = router
	}

	// MARK: - Public methods

	func mainViewController() -> MainViewController {
		let viewController = UIStoryboard.instantiateViewControllerOfType(MainViewController.self)
		viewController.router = router
		return viewController
	}
}
