//
//  JSONFileReader.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

struct JSONFileReader {

	func contentsOfFile(withFilename filename: String) throws -> Any {
		guard
			let filePath = Bundle.main.path(forResource: filename, ofType: "json"),
			let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
				throw UtilityError.jsonFileReadUnsuccessful
		}

		do {
			let json = try JSONSerialization.jsonObject(with: jsonData, options: [ .allowFragments ])
			return json
		} catch {
			throw error
		}
	}
}
