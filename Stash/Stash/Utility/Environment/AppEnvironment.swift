//
//  AppEnvironment.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

final class AppEnvironment {

	init() {
		let router: Router = Router()
		router.setupRouters(withViewControllerBuilder: ViewControllerBuilder(router: router))
		router.setupRootViewController()
	}
}
