//
//  CoachViewControllerBuilder.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct CoachViewControllerBuilder {

	// MARK: - Private properties

	private let router: Router
	private let resource: CoachResource

	// MARK: - Init

	init(router: Router, resource: CoachResource) {
		self.router = router
		self.resource = resource
	}

	// MARK: - Public methods

	func coachViewController() -> CoachViewController {
		let viewController = UIStoryboard.instantiateViewControllerOfType(CoachViewController.self)
		viewController.router = router
		viewController.interactor = AchievementsInteractor(
			presenter: AchievementsPresenter(viewController: viewController),
			resource: resource
		)
		return viewController
	}
}
