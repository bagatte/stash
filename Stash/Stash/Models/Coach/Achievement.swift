//
//  Achievement.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct Achievement: Model {

	let id: Int
	let level: String
	let progress: Int
	let total: Int
	let backgroundImageUrl: String
	let isAccessible: Bool

	init?(json: JSON) {
		guard
			let id: Int = json["id"] as? Int,
			let level: String = json["level"] as? String,
			let progress: Int = json["progress"] as? Int,
			let total: Int = json["progress"] as? Int,
			let backgroundImageUrl: String = json["bg_image_url"] as? String,
			let isAccessible: Bool = json["accessible"] as? Bool else {
				return nil
		}

		self.id = id
		self.level = level
		self.progress = progress
		self.total = total
		self.backgroundImageUrl = backgroundImageUrl
		self.isAccessible = isAccessible
	}
}
