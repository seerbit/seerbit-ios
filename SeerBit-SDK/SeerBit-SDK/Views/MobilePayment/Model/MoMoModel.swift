//
//  MoMoModel.swift
//  SeerBit-SDK
//
//  Created by Princess on 27/04/2023.
//

import Foundation

// MARK: - WelcomeElement
struct MomoModel: Codable {
    let id: Int
    let networks, networkCode, countryCode, status: String
    let processorCode: String
    let voucherCode: Bool
}

typealias Momo = [MomoModel]
