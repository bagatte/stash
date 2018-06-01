//
//  JSONParser.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

typealias JSON = [String: Any]

struct JSONParser {

	func parse<T : Model>(json: Any) throws -> T {
		guard let json = json as? JSON else {
			throw UtilityError.jsonParserInvalidJSON
		}

		guard let parsedObject =  T(json: json) else {
			throw UtilityError.jsonParserDecodingFailure
		}

		return parsedObject
	}
}
