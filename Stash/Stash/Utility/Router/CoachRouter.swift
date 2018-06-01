//
//  CoachRouter.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

final class CoachRouter {

	// MARK: - Private properties
	
	private let viewControllerBuilder: CoachViewControllerBuilder

	// MARK: - Init
	
	init(viewControllerBuilder: CoachViewControllerBuilder) {
		self.viewControllerBuilder = viewControllerBuilder
	}

	// MARK: - Public methods

	func routeToAchievementsViewController(presentationStyle: PresentationStyle) {
		let viewController = viewControllerBuilder.achievementsViewController()
		UIViewController.route(viewController, presentationStyle: presentationStyle)
	}
}
