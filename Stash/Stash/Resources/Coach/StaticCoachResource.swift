//
//  StaticCoachResource.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct StaticCoachResource: CoachResource {

	// MARK: - Private properties

	private let jsonFileReader: JSONFileReader
	private let jsonParser: JSONParser

	// MARK: - Init

	init(jsonFileReader: JSONFileReader, jsonParser: JSONParser) {
		self.jsonFileReader = jsonFileReader
		self.jsonParser = jsonParser
	}

	// MARK: - Public properties
	
	func fetchInvestor(completion: ((Result<Investor>) -> Void)) throws {
		
	}
}
