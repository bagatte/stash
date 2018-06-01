//
//  MainViewController.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	// MARK: - Lifecycle methods

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension MainViewController: StoryboardInstantiable {

	static var storyboard: UIStoryboard {
		return UIStoryboard.mainStoryboard
	}
}
