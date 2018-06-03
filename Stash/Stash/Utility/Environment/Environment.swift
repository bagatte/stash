//
//  Environment.swift
//  Stash
//
//  Created by Bruno Agatte on 6/2/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

protocol Environment {

	var jsonFileReader: JSONFileReader { get }
	var jsonParser: JSONParser { get }
}
