//
//  CoachViewController.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

protocol AchievementsDisplayLogic: class {

	func displayFetchedAchievements(viewModels: [AchievementViewModel])
}

class CoachViewController: UICollectionViewController {

	// MARK: - Public properties

	var interactor: AchievementsBusinessLogic!
	weak var router: Router!

	// MARK: - Private properties

	private var achievementViewModels: [AchievementViewModel]?

	// MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

		interactor.fetchAchievements()
    }

	// MARK: - UICollectionViewDataSource

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return achievementViewModels?.count ?? 0
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StashCell", for: indexPath)
		cell.backgroundColor = UIColor.blue
		return cell
	}
}

// MARK: - AchievementsDisplayLogic

extension CoachViewController : AchievementsDisplayLogic {

	func displayFetchedAchievements(viewModels: [AchievementViewModel]) {
		achievementViewModels = viewModels
		collectionView?.reloadData()
	}
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CoachViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellWidth = collectionView.bounds.size.width - 50
		return CGSize(width: cellWidth, height: cellWidth / 1.5)
	}
}

// MARK: - StoryboardInstantiable

extension CoachViewController: StoryboardInstantiable {

	static var storyboard: UIStoryboard {
		return UIStoryboard.coachStoryboard
	}
}
