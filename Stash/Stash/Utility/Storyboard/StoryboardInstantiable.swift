//
//  StoryboardInstantiable.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable {

	static var storyboard: UIStoryboard { get }
}

extension StoryboardInstantiable {

	static var identifier: String {
		return String(describing: self)
	}
}
