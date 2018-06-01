//
//  AchievementsViewController.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {

	// MARK: - Public properties

	weak var router: Router!

	// MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

		navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - StoryboardInstantiable

extension AchievementsViewController: StoryboardInstantiable {

	static var storyboard: UIStoryboard {
		return UIStoryboard.coachStoryboard
	}
}
