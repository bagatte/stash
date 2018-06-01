//
//  AchievementsPresenter.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

protocol AchievementsPresentationLogic {

	func presentAchievements(_ achievements: [Achievement]?)
	func presentError(_ error: Error)
}

class AchievementsPresenter {

	private weak var viewController: AchievementsDisplayLogic!

	init(viewController: AchievementsDisplayLogic) {
		self.viewController = viewController
	}
}

// MARK: - AchievementsPresentationLogic

extension AchievementsPresenter: AchievementsPresentationLogic {

	func presentAchievements(_ achievements: [Achievement]?) {
		guard let achievements = achievements else {
			return
		}

		var viewModels: [AchievementViewModel] = []

		for achievement in achievements {
			let viewModel = AchievementViewModel(achievement: achievement)
			viewModels.append(viewModel)
		}

		viewController.displayFetchedAchievements(viewModels: viewModels)
	}

	func presentError(_ error: Error) {
		guard let utilityError = error as? UtilityError else {
			print(error.localizedDescription)
			return
		}
		print(utilityError.localizedDescription)
	}
}
