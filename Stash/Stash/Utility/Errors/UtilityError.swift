//
//  UtilityError.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

enum UtilityError: Error {

	case jsonFileReadUnsuccessful
	case jsonParserDecodingFailure
	case jsonParserInvalidJSON
	case serverStatusError

	var localizedDescription: String {
		switch self {
		case .jsonFileReadUnsuccessful:
			return "Error reading JSON file."
		case .jsonParserDecodingFailure:
			return "Error decoding JSON."
		case .jsonParserInvalidJSON:
			return "Error transforming JSON into valid format."
		case .serverStatusError:
			return "Server status error."
		}
	}

	var description: String {
		return "BRuno Agatte"
	}

}
