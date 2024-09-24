//
//  API.swift
//  RVIP
//
//  Created by Александр Иванов on 31.07.2024.
//

import Foundation

// MARK: - UserSessionProtocol

protocol UserSessionProtocol {
    var serverLink: ServerLink! { get set }
    var networkClient: AsyncHttpClient! { get }
}

// MARK: - UserSession

final class UserSession: UserSessionProtocol {
    var networkClient: AsyncHttpClient!
    var serverLink: ServerLink! {
        didSet {
            do {
                let url = try endpoint(baseURL: serverLink.stringURL)
                networkClient.baseURL = url
            } catch {
                print("Ошибка создания URL: \(error.localizedDescription)")
            }
        }
    }
    
    private let headers = [
        "Authorization": "token"
    ]
    
    private let timeoutIntervalForRequest: TimeInterval = 60
    
    init() {
        setupNetworkClient()
    }
    
    private func setupNetworkClient() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        configuration.timeoutIntervalForRequest = timeoutIntervalForRequest
        networkClient = AsyncHttpJsonClient(configuration: configuration, requestRetrier: self, responseValidator: self)
        serverLink = .rickandmorty
    }
    
    private func endpoint(baseURL: String) throws -> URL {
        guard let url = URL(string: baseURL) else { throw URLError(.badURL) }
        return url
    }
}

// MARK: - AsyncHttpResponseValidator

extension UserSession: AsyncHttpResponseValidator {
    func validate(response: HTTPURLResponse, data: Data?) throws {
        
    }
}

// MARK: - AsyncHttpRequestRetrier

extension UserSession: AsyncHttpRequestRetrier {
    func shouldRetry(request: URLRequest, error: any Error) async -> Bool {
        false
    }
}
