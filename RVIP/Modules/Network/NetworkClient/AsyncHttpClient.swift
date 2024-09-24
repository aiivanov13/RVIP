// Copyright © 2022 Oleg Bakharev. All rights reserved.
// Created by Oleg Bakharev

import Foundation

/// Тюнеры запросов
public enum AsyncHttpRequestTuners {
    /// Тюнер запроса - позволяет как угодно настроить запрос
    case request((inout URLRequest) -> Void)

    /// Тюнер ответа - позволяет валидировать и извлекать данные из заголовка ответа
    case response((HTTPURLResponse) throws -> Void)

    /// Тюнер кодера. Позволяет кастомизировать кодер
    case encoder((inout JSONEncoder) -> Void)

    /// Тюнер декодера. Позволяет кастомизировать декодер
    case decoder((inout JSONDecoder) -> Void)

    public enum Keys {
        case request
        case response
        case encoder
        case decoder
    }
}

public struct AsyncHttpClientEmpty: Codable {
    public init() {}
}

/// Асинхронный HTTP клиент
public protocol AsyncHttpClient {

    var session: URLSession { get }
    var baseURL: URL! { get set }

    /// GET HTTP method
    /// Для удобства формирования parameters удобно использовать CompactDictionaryRepresentable
    func get<Target: Decodable>(
        path: String,
        parameters: [String: Any],
        tuners: [AsyncHttpRequestTuners.Keys: AsyncHttpRequestTuners]
    ) async throws -> Target

    /// POST HTTP method
    func post<Body: Encodable, Target: Decodable>(
        path: String,
        body: Body,
        tuners: [AsyncHttpRequestTuners.Keys: AsyncHttpRequestTuners]
    ) async throws -> Target

    /// PUT HTTP method
    func put<Body: Encodable, Target: Decodable>(
        path: String,
        body: Body,
        tuners: [AsyncHttpRequestTuners.Keys: AsyncHttpRequestTuners]
    ) async throws -> Target

    /// DELETE HTTP method
    func delete<Body: Encodable, Target: Decodable>(
        path: String,
        body: Body,
        tuners: [AsyncHttpRequestTuners.Keys: AsyncHttpRequestTuners]
    ) async throws -> Target

    /// PATCH HTTP method
    func patch<Body: Encodable, Target: Decodable>(
        path: String,
        body: Body,
        tuners: [AsyncHttpRequestTuners.Keys: AsyncHttpRequestTuners]
    ) async throws -> Target
}

/// Расширение делающее необязательными некоторые параметры и возвращаемые результаты
public extension AsyncHttpClient {
    func get<Target: Decodable>(
        path: String,
        parameters: [String: Any] = [:]
    ) async throws -> Target {
        try await get(
            path: path,
            parameters: parameters,
            tuners: [:]
        )
    }
    
    func get<Target: Decodable>(
        path: String,
        tuners: [AsyncHttpRequestTuners.Keys: AsyncHttpRequestTuners]
    ) async throws -> Target {
        try await get(
            path: path,
            parameters: [:],
            tuners: tuners
        )
    }
    
    func post<Body: Encodable, Target: Decodable>(
        path: String,
        body: Body = AsyncHttpClientEmpty()
    ) async throws -> Target {
        try await post(
            path: path,
            body: body,
            tuners: [:]
        )
    }
    
    func post<Body: Encodable>(
        path: String,
        body: Body = AsyncHttpClientEmpty()
    ) async throws {
        try await emptyResponseCall {
            let _: AsyncHttpClientEmpty = try await post(
                path: path,
                body: body,
                tuners: [:]
            )
        }
    }
    
    func put<Body: Encodable, Target: Decodable>(
        path: String,
        body: Body = AsyncHttpClientEmpty()
    ) async throws -> Target {
        try await put(
            path: path,
            body: body,
            tuners: [:]
        )
    }
    
    func put<Body: Encodable> (
        path: String,
        body: Body = AsyncHttpClientEmpty()
    ) async throws {
        try await emptyResponseCall {
            let _: AsyncHttpClientEmpty = try await put(
                path: path,
                body: body,
                tuners: [:]
            )
        }
    }
    
    func delete<Body: Encodable, Target: Decodable>(
        path: String,
        body: Body = AsyncHttpClientEmpty()
    ) async throws -> Target {
        try await delete(
            path: path,
            body: body,
            tuners: [:]
        )
    }
    
    func delete<Body: Encodable>(
        path: String,
        body: Body = AsyncHttpClientEmpty()
    ) async throws {
        try await emptyResponseCall {
            let _: AsyncHttpClientEmpty = try await delete(
                path: path,
                body: body,
                tuners: [:]
            )
        }
    }
    
    func patch<Body: Encodable, Target: Decodable>(
        path: String,
        body: Body = AsyncHttpClientEmpty()
    ) async throws -> Target {
        try await patch(
            path: path,
            body: body,
            tuners: [:]
        )
    }
    
    func patch<Body: Encodable>(
        path: String,
        body: Body = AsyncHttpClientEmpty()
    ) async throws {
        try await emptyResponseCall {
            let _:AsyncHttpClientEmpty = try await patch(
                path: path,
                body: body,
                tuners: [:]
            )
        }
    }
}

// MARK: - Private part

private extension AsyncHttpClient {
    func emptyResponseCall(body: () async throws -> Void) async rethrows {
        do {
            try await body()
        } catch let urlError as URLError {
            if !((0..<400) ~= urlError.code.rawValue) {
                throw urlError
            }
        }
    }
}
