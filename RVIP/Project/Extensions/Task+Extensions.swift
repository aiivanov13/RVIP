//
//  Task+Extensions.swift
//  RVIP
//
//  Created by Александр Иванов on 16.08.2024.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: UInt64) async throws {
        try await sleep(nanoseconds: seconds * 1_000_000_000)
    }
}
