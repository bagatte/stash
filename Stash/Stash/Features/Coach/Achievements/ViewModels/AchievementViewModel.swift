//
//  AchievementViewModel.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct AchievementViewModel {

	let level: String
	let currentPoints: String
	let totalPoints: String
	let completionPercentage: Int
	let imageUrl: URL?
	let isAccessible: Bool

	init(achievement: Achievement) {
		level = achievement.level
		currentPoints = "\(String(achievement.progress))pts"
		totalPoints = "\(String(achievement.total))pts"
		completionPercentage = 0
		imageUrl = URL(string: achievement.backgroundImageUrl)
		isAccessible = achievement.isAccessible
	}
}
