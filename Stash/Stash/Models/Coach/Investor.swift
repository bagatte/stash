//
//  Investor.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct Investor: Model {

	let status: Int
	let success: Bool
	let title: String
	let achievements: [Achievement]?

	init?(json: JSON) {
		guard
			let success: Bool = json["success"] as? Bool,
			let status: Int = json["status"] as? Int,
			let overview: JSON = json["overview"] as? JSON,
			let title: String = overview["title"] as? String,
			let achievements: [JSON] = json["achievements"] as? [JSON] else {
				return nil
		}

		self.status = status
		self.success = success
		self.title = title
		self.achievements = Investor.parseAchievements(fromJsonArray: achievements)
	}

	static func parseAchievements(fromJsonArray jsonArray: [JSON]) -> [Achievement]? {
		var achievements: [Achievement] = []

		for json in jsonArray {
			guard let achievement: Achievement = Achievement(json: json) else {
				continue
			}
			achievements.append(achievement)
		}

		return achievements.isEmpty ? nil : achievements
	}
}
