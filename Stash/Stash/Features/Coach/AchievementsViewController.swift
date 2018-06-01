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
	var resource: CoachResource!

	// MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

		navigationController?.setNavigationBarHidden(false, animated: true)

		do {
			try resource.fetchInverstor { result in
				switch result {
				case .success(let investor):
					print("HEREEE: \(investor)")

				case .error(let error):
					guard let utilityError = error as? UtilityError else {
						print(error.localizedDescription)
						return
					}

					print(utilityError.localizedDescription)
				}
			}
		} catch {
			print("Error: \(error.localizedDescription)")
		}
    }
}

// MARK: - StoryboardInstantiable

extension AchievementsViewController: StoryboardInstantiable {

	static var storyboard: UIStoryboard {
		return UIStoryboard.coachStoryboard
	}
}
