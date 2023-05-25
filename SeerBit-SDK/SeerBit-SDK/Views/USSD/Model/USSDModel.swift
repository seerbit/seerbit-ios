//
//  USSDModel.swift
//  SeerBit-SDK
//
//  Created by Princess on 27/04/2023.
//

import Foundation


struct USSDModel: Codable {
    let status: String
    let data: USSDDataClass
}

// MARK: - DataClass
struct USSDDataClass: Codable {
    let code, message: String
    let payments: USSDPayments
}

// MARK: - Payments
struct USSDPayments: Codable {
    let paymentReference, linkingReference, providerreference, ussdDailCode: String
}


// MARK: - Welcome
struct InitiateUSSD: Codable {
    let fullName, mobileNumber, email, publicKey: String
    let amount, currency, country, paymentReference: String
    let productID, productDescription: String
    let redirectURL: String
    let paymentType, channelType, ddeviceType, sourceIP: String
    let source, fee: String
    let retry: Bool
    let bankCode: String

    enum CodingKeys: String, CodingKey {
        case fullName, mobileNumber, email, publicKey, amount, currency, country, paymentReference
        case productID = "productId"
        case productDescription
        case redirectURL = "redirectUrl"
        case paymentType, channelType, ddeviceType, sourceIP, source, fee, retry, bankCode
    }
}
