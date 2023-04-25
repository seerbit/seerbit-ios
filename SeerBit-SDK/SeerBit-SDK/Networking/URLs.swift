//
//  URLs.swift
//  SeerBit-SDK
//
//  Created by Princess on 19/04/2023.
//

import Foundation


struct SeerBitURLs {
    static let get_banks = BASE_URL + "checkout/banks"
    static let post_initiate_bankAccount = BASE_URL + "checkout/initiates"
    static let post_initiate_USSD = BASE_URL + "checkout/initiates"
    static let post_initiate_transfer = BASE_URL + "checkout/initiates"
    static let post_initiate_card_live = BASE_URL + "checkout/initiates"
    static let post_initiate_card_test = BASE_URL + "sandbox/initiates"
    static let post_momo = BASE_URL + "checkout/initiates"
    static let get_merchant_details = BASE_URL + "checkout/merchant/clear/SBTESTPUBK_t4G16GCA1O51AV0Va3PPretaisXubSw1"
    static let get_pocket_details = BASE_URL + "checkout/pocket/SBP0000015/J0DvgNm7"
    static let get_momo_networks = BASE_URL + "tranmgt/networks/GH/00000103"
    static let get_query_transaction = BASE_URL + "checkout/query/SBT-T54367073117"
    static let get_card_bin = BASE_URL + "checkout/bin/512345"
    static let post_otp_card_live = BASE_URL + "sandbox/otp"
    static let post_otp_card_test = BASE_URL + "checkout/otp"
    static let post_otp_card_recurrent = BASE_URL + "recurrent/checkout/otp"
    static let post_otp_account = BASE_URL + "checkout/validate"
    static let post_otp_momo = BASE_URL + "checkout/momo/otp"
    static let get_abort_transaction = BASE_URL + "checkout/abandon/pub/SBTESTPUBK_t4G16GCA1O51AV0Va3PPretaisXubSw1/SBT-T54367073117"
}
