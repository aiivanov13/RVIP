//
//  API.swift
//  RVIP
//
//  Created by Александр Иванов on 31.07.2024.
//

import Foundation

enum ApiVersion {
    case beta
    case dev
    
    var stringURL: String {
        switch self {
        case .beta:
            return ServerLinks.betaURL
        case .dev:
            return ServerLinks.devURL
        }
    }
}

protocol UserSessionProtocol {
    var apiVersion: ApiVersion! { get set }
    var networkClient: AsyncHttpClient! { get }
}

final class UserSession: UserSessionProtocol {
    var networkClient: AsyncHttpClient!
    var apiVersion: ApiVersion! {
        didSet {
            do {
                let url = try endpoint(baseURL: apiVersion.stringURL)
                networkClient.baseURL = url
            } catch {
                print("Ошибка создания URL: \(error.localizedDescription)")
            }
        }
    }
    
    private let headers = [
        "Authorization": "token"
    ]
    
    init() {
        setupNetworkClient()
    }
    
    private func setupNetworkClient() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        networkClient = AsyncHttpJsonClient(configuration: configuration, requestRetrier: self, responseValidator: self)
        apiVersion = .beta
    }
    
    private func endpoint(baseURL: String) throws -> URL {
        guard let url = URL(string: baseURL) else { throw URLError(.badURL) }
        return url
    }
}

extension UserSession: AsyncHttpResponseValidator {
    func validate(response: HTTPURLResponse, data: Data?) throws {
        
    }
}

extension UserSession: AsyncHttpRequestRetrier {
    func shouldRetry(request: URLRequest, error: any Error) async -> Bool {
        false
    }
}
