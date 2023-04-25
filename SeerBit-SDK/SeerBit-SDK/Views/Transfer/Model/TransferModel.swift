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

// MARK: - TransferModel
struct TransferModel1: Codable {
    let status: String
    let data: TransferDataClass
}

// MARK: - DataClass
struct TransferDataClass: Codable {
    let code, message: String
    let payments: Payments
}

// MARK: - Payments
struct Payments: Codable {
    let paymentReference, linkingReference, walletName, wallet: String
    let bankName, accountNumber: String
}
