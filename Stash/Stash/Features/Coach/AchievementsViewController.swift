//
//  AchievementsViewController.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

protocol AchievementsDisplayLogic: class {

	func displayFetchedAchievements(viewModels: [AchievementViewModel])
}

class AchievementsViewController: UIViewController {

	// MARK: - Public properties

	var interactor: AchievementsBusinessLogic!
	weak var router: Router!

	// MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

		navigationController?.setNavigationBarHidden(false, animated: true)

		interactor.fetchAchievements()
    }
}

// MARK: - AchievementsDisplayLogic

extension AchievementsViewController : AchievementsDisplayLogic {

	func displayFetchedAchievements(viewModels: [AchievementViewModel]) {
		print(viewModels)
	}
}

// MARK: - StoryboardInstantiable

extension AchievementsViewController: StoryboardInstantiable {

	static var storyboard: UIStoryboard {
		return UIStoryboard.coachStoryboard
	}
}
