//
//  CoachResource.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

protocol CoachResource {

	func fetchInvestor(completion: ((Result<Investor>) -> Void)) throws
}
