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

class AchievementsViewController: UICollectionViewController {

	static let cellNibName: String = "AchievementCollectionViewCell"
	static let cellIdentifier: String = "AchievementCell"

	// MARK: - Public properties

	var interactor: AchievementsBusinessLogic!
	weak var router: Router!

	// MARK: - Private properties

	private var achievementViewModels: [AchievementViewModel]?

	// MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

		UIApplication.shared.statusBarStyle = .lightContent

		collectionView?
			.register(UINib(nibName: AchievementsViewController.cellNibName, bundle: nil),
					  forCellWithReuseIdentifier: AchievementsViewController.cellIdentifier)

		interactor.fetchAchievements()
    }

	// MARK: - UICollectionViewDataSource

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return achievementViewModels?.count ?? 0
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard
			let cell = collectionView
				.dequeueReusableCell(withReuseIdentifier: AchievementsViewController.cellIdentifier,
									 for: indexPath) as? AchievementCollectionViewCell,
			let viewModel = achievementViewModels?[indexPath.row] else {
				return UICollectionViewCell()
		}

		cell.layoutIfNeeded()
		cell.layout(withViewModel: viewModel)

		return cell
	}
}

// MARK: - AchievementsDisplayLogic

extension AchievementsViewController : AchievementsDisplayLogic {

	func displayFetchedAchievements(viewModels: [AchievementViewModel]) {
		achievementViewModels = viewModels
		collectionView?.reloadData()
	}
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AchievementsViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellWidth = collectionView.bounds.size.width - 50
		return CGSize(width: cellWidth, height: cellWidth / 1.5)
	}
}

// MARK: - StoryboardInstantiable

extension AchievementsViewController: StoryboardInstantiable {

	static var storyboard: UIStoryboard {
		return UIStoryboard.coachStoryboard
	}
}
