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

	internal var jsonFileReader: JSONFileReader
	internal var jsonParser: JSONParser

	// MARK: - Init

	init(jsonFileReader: JSONFileReader, jsonParser: JSONParser) {
		self.jsonFileReader = jsonFileReader
		self.jsonParser = jsonParser
	}

	// MARK: - Public properties
	
	func fetchInvestor(completion: ((Result<Investor>) -> Void)) throws {
		let json = try jsonFileReader.contentsOfFile(withFilename: "achievements")
		let investor: Investor = try jsonParser.parse(json: json)

		if !(200...299 ~= investor.status) {
			completion(Result.error(UtilityError.serverStatusError))
		} else if !investor.success {
			completion(Result.error(UtilityError.serverResponseError))
		} else {
			completion(Result.success(value: investor))
		}
	}
}
