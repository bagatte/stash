//
//  LocalCoachResource.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct LocalCoachResource: CoachResource {

	// MARK: - Private properties

	private let jsonFileReader: JSONFileReader
	private let jsonParser: JSONParser

	// MARK: - Init
	
	init(jsonFileReader: JSONFileReader, jsonParser: JSONParser) {
		self.jsonFileReader = jsonFileReader
		self.jsonParser = jsonParser
	}

	// MARK: - Public properties

	func fetchInverstor(completion: ((Result<Investor>) -> Void)) throws {
		let json = try jsonFileReader.contentsOfFile(withFilename: "achievements")
		let investor: Investor = try jsonParser.parse(json: json)

		if investor.status != 200 || !investor.success {
			completion(Result.error(UtilityError.serverStatusError))
		} else {
			completion(Result.success(value: investor))
		}
	}
}
