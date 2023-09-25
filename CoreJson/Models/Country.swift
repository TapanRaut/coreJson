//
//  Country.swift
//  CoreJson
//
//  Created by Tapan Raut on 23/09/23.
//

import Foundation

class Country: Codable {
    let id: Int?
    let name, codeCountry: String?
    let avatar: String?
    let status: Int?
    let statusLabel: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case codeCountry = "code_country"
        case avatar, status
        case statusLabel = "status_label"
    }

    init(id: Int?, name: String?, codeCountry: String?, avatar: String?, status: Int?, statusLabel: String?) {
        self.id = id
        self.name = name
        self.codeCountry = codeCountry
        self.avatar = avatar
        self.status = status
        self.statusLabel = statusLabel
    }
}
