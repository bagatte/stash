//
//  CoachResource.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

protocol CoachResource {

	var jsonFileReader: JSONFileReader { get }
	
	var jsonParser: JSONParser { get }

	func fetchInvestor(completion: ((Result<Investor>) -> Void)) throws
}
