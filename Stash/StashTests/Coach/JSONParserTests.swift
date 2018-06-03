//
//  JSONParserTests.swift
//  StashTests
//
//  Created by Bruno Agatte on 6/2/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import XCTest

class JSONParserTests: XCTestCase {

	private let jsonFileReader: JSONFileReader = JSONFileReader()
	private let jsonParser: JSONParser = JSONParser()
    
	func testInvestorJsonIsParsedIntoModel() {
		testJsonIsParsedIntoModel(filename: "achievements_test", model: Investor.self)
	}

	func testAchievementsJsonIsParsedIntoModel() {
		let json = try! jsonFileReader.contentsOfFile(withFilename: "achievements_test") as! JSON
		let achievementsJson: [JSON] = json["achievements"] as! [JSON]

		for json in achievementsJson {
			testJsonIsParsedIntoModel(fromJson: json, model: Achievement.self)
		}
	}

	// MARK: - Private methods

	private func testJsonIsParsedIntoModel<T: Model>(filename: String, model: T.Type) {
		let json = try! jsonFileReader.contentsOfFile(withFilename: filename)
		parseJson(json, model: model)
	}

	private func testJsonIsParsedIntoModel<T: Model>(fromJson json: Any, model: T.Type) {
		parseJson(json, model: model)
	}

	private func parseJson<T: Model>(_ json: Any, model: T.Type) {
		do {
			let _: T = try jsonParser.parse(json: json)
		} catch {
			XCTFail("Coulnd't parse json into \(model) \(error)")
		}
	}
}
