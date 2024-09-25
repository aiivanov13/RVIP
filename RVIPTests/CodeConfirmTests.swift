//
//  CodeConfirmTests.swift
//  RVIPTests
//
//  Created by Александр Иванов on 24.09.2024.
//

import XCTest
@testable import RVIP

// MARK: - CodeConfirmWorkerTests

final class CodeConfirmWorkerTests: XCTestCase {
    var sut: CodeConfirmWorkerLogicProtocol!
    
    // MARK: Setups

    override func setUp() async throws {
        try await super.setUp()
        
        let userSession = UserSession()
        sut = CodeConfirmWorker(userSession: userSession)
    }
    
    override func tearDown() async throws {
        try await super.tearDown()
    
        sut = nil
    }
    
    // MARK: Tests

    func testSutGetCharacters() async {
        let task = Task { [weak self] in try await self?.sut.getCharacters() }
        
        await Task.yield()
        
        let characters = try? await task.value
        
        XCTAssertNotNil(characters)
    }
    
    func testSutGetLocations() async {
        let task = Task { [weak self] in try await self?.sut.getLocations() }
        
        await Task.yield()
        
        let locations = try? await task.value
        
        XCTAssertNotNil(locations)
    }
}
