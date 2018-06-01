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
	func presentNavigationBarTitle(_ title: String)
	func presentError(_ error: Error)
}

class AchievementsPresenter {

	// MARK: - Private properties

	private weak var viewController: (AchievementsDisplayLogic & UIViewController)!

	// MARK: - Init

	init(viewController: AchievementsDisplayLogic & UIViewController) {
		self.viewController = viewController
	}

	// MARK: - Private methods

	private func setupNavigationBar(withTitle title: String?) {
		viewController.title = title

		viewController.navigationController?
			.setNavigationBarHidden(false, animated: true)
		viewController.navigationController?.navigationBar
			.barTintColor = UIColor(red: 105.0/255.0, green: 62.0/255.0, blue: 203.0/255.0, alpha: 1)
		viewController.navigationController?.navigationBar
			.tintColor = UIColor.white
		viewController.navigationController?.navigationBar
			.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
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

	func presentNavigationBarTitle(_ title: String) {
		setupNavigationBar(withTitle: title)
	}

	func presentError(_ error: Error) {
		setupNavigationBar(withTitle: nil)
		UIAlertController.displayAlert(withError: error, in: viewController)
	}
}
