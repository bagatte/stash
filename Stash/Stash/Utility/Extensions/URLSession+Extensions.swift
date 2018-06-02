//
//  URLSession+Extensions.swift
//  Stash
//
//  Created by Bruno Agatte on 6/1/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import UIKit

extension URLSession {

	static func fetchDataFromUrl(_ url: URL, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
		shared.dataTask(with: url, completionHandler: completion).resume()
	}
}
