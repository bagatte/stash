//
//  UIStoryboard+StoryboardInstantiable.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

extension UIStoryboard {

	static var mainStoryboard: UIStoryboard {
		return UIStoryboard(name: "Main", bundle: nil)
	}

	static var coachStoryboard: UIStoryboard {
		return UIStoryboard(name: "Coach", bundle: nil)
	}

	static func instantiateViewControllerOfType<T: StoryboardInstantiable>(_ type: T.Type) -> T {
		guard let viewController = T.storyboard.instantiateViewController(withIdentifier: T.identifier) as? T else {
			fatalError("Could not instantiate view controller from storyboard.")
		}

		return viewController
	}
}
