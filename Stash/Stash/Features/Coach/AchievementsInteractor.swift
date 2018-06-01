//
//  AchievementsInteractor.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

protocol AchievementsBusinessLogic {

	func fetchAchievements()
}

class AchievementsInteractor {

	private let presenter: AchievementsPresentationLogic
	private let resource: CoachResource

	init(presenter: AchievementsPresentationLogic, resource: CoachResource) {
		self.presenter = presenter
		self.resource = resource
	}
}

// MARK: - AchievementsBusinessLogic

extension AchievementsInteractor: AchievementsBusinessLogic {

	func fetchAchievements() {
		do {
			try resource.fetchInvestor { [weak self] result in
				switch result {
				case .success(let investor):
					self?.presenter.presentAchievements(investor.achievements)

				case .error(let error):
					self?.presenter.presentError(error)
				}
			}
		} catch {
			presenter.presentError(error)
		}
	}
}
