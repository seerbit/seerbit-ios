//
//  DropDownMenuTest.swift
//  SeerBit-SDK
//
//  Created by Princess on 16/03/2023.
//

import Foundation


struct AllBanksModel: Identifiable, Hashable {
    let id = UUID().uuidString
    let bankName: String
    
    static let example: [AllBanksModel] = [AllBanksModel(bankName: "United Bank of Africa"),
                         AllBanksModel(bankName: "Zenith Bank"),
                         AllBanksModel(bankName: "Ecobank"),
                         AllBanksModel(bankName: "Guarantee Trust Bank")]
}


struct MomoNetworks: Identifiable, Codable {
    let id: Int
    let networks, networkCode, countryCode, status: String
    let processorCode: String
    let voucherCode: Bool
    
    static let example: [MomoNetworks] = [MomoNetworks(id: 1, networks: "MTN", networkCode: "MTN", countryCode: "GH", status: "ACTIVE", processorCode: "APPS_N_MOBILE", voucherCode: false)
    ]
}
