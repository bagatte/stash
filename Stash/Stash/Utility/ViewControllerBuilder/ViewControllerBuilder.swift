//
//  ViewControllerBuilder.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct ViewControllerBuilder {

	// MARK: - Private properties
	
	private let router: Router

	// MARK: - Init
	
	init(router: Router) {
		self.router = router
	}

	// MARK: - Public properties

	var mainViewControllerBuilder: MainViewControllerBuilder {
		return MainViewControllerBuilder(router: router)
	}

	var coachViewControllerBuilder: CoachViewControllerBuilder {
		return CoachViewControllerBuilder(router: router)
	}
}
