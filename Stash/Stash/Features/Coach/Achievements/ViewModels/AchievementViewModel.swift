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
		completionPercentage = AchievementViewModel.calculatePercentage(min: achievement.progress, max: achievement.total)
		imageUrl = URL(string: achievement.backgroundImageUrl)
		isAccessible = achievement.isAccessible
	}

	static func calculatePercentage(min: Int, max: Int) -> Int {
		let total = min * 100
		let percentage = total / max
		return percentage
	}
}
