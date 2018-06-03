//
//  Router.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

final class Router {

	// MARK: - Private properties

	private(set) var mainRouter: MainRouter!
	private(set) var coachRouter: CoachRouter!

	// MARK: - Public methods

	func setupRouters(withViewControllerBuilder viewControllerBuilder: ViewControllerBuilder) {
		mainRouter = MainRouter(viewControllerBuilder: viewControllerBuilder.mainViewControllerBuilder)
		coachRouter = CoachRouter(viewControllerBuilder: viewControllerBuilder.coachViewControllerBuilder)
	}

	func setupRootViewController() {
		mainRouter.routeToRootViewController()
	}
}
