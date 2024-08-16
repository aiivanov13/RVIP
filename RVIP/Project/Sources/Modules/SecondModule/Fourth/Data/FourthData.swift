//
//  FourthData.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

struct FourthData {
    let title: String
}

struct ProfileInfo: Codable {
    var vehicle: Vehicle
    var city: City?
    var email: String?
    var firstName: String?
    let id: Int
    var lastName: String?
    var middleName: String?
    var organization: OrganizationInfo?
    let phone: String
    let role: AvailableRoles
    let status: ProfileStatus
    let isNewcomer: Bool
    var isNewsNotification: Bool
    var isInfoNotification: Bool
}

struct VehicleType: Codable {
    let id: Int
    let name: String
}

struct Vehicle: Codable {
    var licensePlate: String? = nil
    var model: String? = nil
    var type: VehicleType?
}

struct City: Codable {
    let lat: String
    let lon: String
    let name: String
}

enum AvailableRoles: String, Codable {
    case SYSTEM_ADMIN, OWNER, ADMIN, MANAGER, CLIENT
}

enum ProfileStatus: String, Codable {
    case ACTIVE, REMOVED, BLOCKED
}

struct OrganizationInfo: Codable {
    let fullName: String
    let id: Int
    let shortName: String
}
