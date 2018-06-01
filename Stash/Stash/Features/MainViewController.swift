//
//  MainViewController.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	// MARK: - Public properties

	weak var router: Router!

	// MARK: - Lifecycle methods

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		navigationController?.setNavigationBarHidden(true, animated: animated)
	}

	// MARK: - IBActions

	@IBAction private func startButtonTapped(_ sender: Any) {
		router.coachRouter
			.routeToAchievementsViewController(
				presentationStyle: .push(navigationController: navigationController)
		)
	}
}

// MARK: - StoryboardInstantiable

extension MainViewController: StoryboardInstantiable {

	static var storyboard: UIStoryboard {
		return UIStoryboard.mainStoryboard
	}
}
