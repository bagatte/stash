//
//  PresentationStyle.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

enum PresentationStyle {
	case push(navigationController: UINavigationController?)
	case present(presenter: UIViewController)
}
