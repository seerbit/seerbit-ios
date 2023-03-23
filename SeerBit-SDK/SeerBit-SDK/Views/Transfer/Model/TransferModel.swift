//
//  TransferModel.swift
//  SeerBit-SDK
//
//  Created by Princess on 23/03/2023.
//

import Foundation


struct TransferModel: Codable {
    let accountNumber: String
    let bank: String
    let beneficiary: String
    let validity: String
    let amountToTransfer: Double
    
    static let example: TransferModel = TransferModel(accountNumber: "0303032213",
                                                      bank: "9Payment Service Bank",
                                                      beneficiary: "SEERBIT(Centric Gateway LTD)",
                                                      validity: "30 minutes",
                                                      amountToTransfer: 1015.00)
}
