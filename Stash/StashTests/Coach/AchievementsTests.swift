//
//  AchievementsTests.swift
//  StashTests
//
//  Created by Bruno Agatte on 6/2/18.
//  Copyright © 2018 Bruno Agatte. All rights reserved.
//

import XCTest

class AchievementsTests: XCTestCase, CoachResource {

	private var investorTest: Investor!
	private var resource: CoachResource!
	internal var jsonFileReader: JSONFileReader = JSONFileReader()
	internal var jsonParser: JSONParser = JSONParser()

    override func setUp() {
        super.setUp()

		resource = StaticCoachResource(jsonFileReader: jsonFileReader, jsonParser: jsonParser)

		let json = try! jsonFileReader.contentsOfFile(withFilename: "achievements_test")
		investorTest = try! jsonParser.parse(json: json) as Investor
    }

	func testInvestorTitle() {
		try! fetchInvestor { result in
			switch result {
			case .success(let investor):
				XCTAssertEqual(investor.title, investorTest.title, "Title doesn't match.")
			case .error(let error):
				testError(error)
			}
		}
	}

	func testFetchAchievements() {
		try! fetchInvestor { result in
			switch result {
			case .success(let investor):
				let achievements: [Achievement]? = investor.achievements

				XCTAssertNotNil(achievements)

				for i in 0..<achievements!.count {
					XCTAssertEqual(achievements![i].id, investorTest.achievements![i].id)
					XCTAssertEqual(achievements![i].level, investorTest.achievements![i].level)
					XCTAssertEqual(achievements![i].progress, investorTest.achievements![i].progress)
					XCTAssertEqual(achievements![i].total, investorTest.achievements![i].total)
					XCTAssertEqual(achievements![i].backgroundImageUrl, investorTest.achievements![i].backgroundImageUrl)
					XCTAssertEqual(achievements![i].isAccessible, investorTest.achievements![i].isAccessible)
				}

			case .error(let error):
				testError(error)
			}
		}
	}

	func testAchievementViewModel() {
		try! fetchInvestor(completion: { result in
			switch result {
			case .success(let investor):
				let achievements: [Achievement]? = investor.achievements

				for achievement in achievements! {
					let viewModel = AchievementViewModel(achievement: achievement)

					XCTAssertEqual(viewModel.level, achievement.level)
					XCTAssertEqual(viewModel.currentPoints, "\(String(achievement.progress))pts")
					XCTAssertEqual(viewModel.totalPoints, "\(String(achievement.total))pts")
					XCTAssertEqual(viewModel.completionPercentage,
								   AchievementViewModel.calculatePercentage(min: achievement.progress,
																			max: achievement.total))
					XCTAssertEqual(viewModel.imageUrl, URL(string: achievement.backgroundImageUrl))
					XCTAssertEqual(viewModel.isAccessible, achievement.isAccessible)
				}

			case .error(let error):
				testError(error)
			}
		})
	}

	func testServerResponse() {
		XCTAssertFalse(!(200...299 ~= investorTest.status), "Status must be between 200 and 299.")
		XCTAssertTrue(investorTest.success, "Server response failed.")
	}

	// MARK: - CoachResource methods

	func fetchInvestor(completion: ((Result<Investor>) -> Void)) throws {
		try resource.fetchInvestor(completion: completion)
	}

	// MARK: - Private methods

	private func testError(_ error: Error) {
		if let utilityError = error as? UtilityError {
			XCTFail("Failed to load achievements: \(utilityError.localizedDescription)")
		} else {
			XCTFail("Failed to load achievements: \(error.localizedDescription)")
		}
	}
}
