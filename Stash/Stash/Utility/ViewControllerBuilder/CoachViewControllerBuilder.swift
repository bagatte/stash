//
//  CoachViewControllerBuilder.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct CoachViewControllerBuilder {

	// MARK: - Public methods

	func achievementsViewController() -> AchievementsViewController {
		let viewController = UIStoryboard.instantiateViewControllerOfType(AchievementsViewController.self)
		return viewController
	}
}
