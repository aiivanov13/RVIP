//
//  FourthWorker.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol FourthWorkerLogicProtocol {
    func getData() async throws -> ProfileInfo
}

//MARK: - FourthWorker

final actor FourthWorker {
    private var network = AsyncHttpJsonClient()
    
    init() {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJBdXRoZW50aWNhdGlvbiIsImlzcyI6Ijd3aW5kcy1hdnRvdGVtYSIsInVzZXJJZCI6MywicGhvbmUiOiIrNzk5OTk5OTExMTEiLCJyb2xlIjoiQ0xJRU5UIiwicGxhdGZvcm0iOiJVTkRFRklORUQiLCJleHAiOjE3MjM5MDU1MDN9.2hGOczTozJUHsUCgi5eEm6XrnVsCfzWvQhRVloZApv_V_U1xYRSp_XxXYRUSQ5cs7ZiweTKfBYpY4J12mmqVww"
        ]
        network.update(configuration: configuration)
    }
}

//MARK: - FourthWorkerLogicProtocol

extension FourthWorker: FourthWorkerLogicProtocol {
    func getData() async throws -> ProfileInfo {
        try await network.get(url: URL(string: "https://avtotemagroup.ru:444/api/profile")!)
    }
}
