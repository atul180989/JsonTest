//
//  UserModel.swift
//  JsonDataExample
//
//  Created by Atul Bhaisare on 2/8/23.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    var firstName: String?
    var address: Address?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "name"
        case address
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.address = try container.decodeIfPresent(Address.self, forKey: .address)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.address, forKey: .address)
    }
}

struct Address: Codable {
    var userCity: String?
    var geo: GeoLocation?
    
    enum CodingKeys: String, CodingKey {
        case userCity = "city"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userCity = try container.decodeIfPresent(String.self, forKey: .userCity)
    }

}
//
//extension Address {
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.userCity = try container.decodeIfPresent(String.self, forKey: .userCity)
//        self.geo = try container.decodeIfPresent(GeoLocation.self, forKey: .geo)
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case userCity = "city"
//        case geo
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(self.userCity, forKey: .userCity)
//        try container.encodeIfPresent(self.geo, forKey: .geo)
//    }
//}

struct GeoLocation: Codable {
    var lat: String?
    var lng: String?
}



