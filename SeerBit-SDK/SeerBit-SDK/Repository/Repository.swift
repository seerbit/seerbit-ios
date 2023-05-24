//
//  Repository.swift
//  SeerBit-SDK
//
//  Created by Princess on 25/04/2023.
//

import Foundation
import Combine

protocol RequestProtocol {
    func fetchAllBank() -> AnyPublisher<GetBanksModel, Error>
    func initiateTransfer(value: InitiateTransfer) -> AnyPublisher<TransferModel1, Error>
    func initiateUSSD(value: InitiateUSSD) -> AnyPublisher<USSDModel, Error>
    func initiateMomo() -> AnyPublisher<[MomoModel], Error>
    func initiateCards(value: InitiateCards) -> AnyPublisher<CardModel, Error>
}

class Repository: RequestProtocol {
   
    private let networkManger: ServiceProtocol!
    private var cancellableSet: Set<AnyCancellable> = []
    
    /// Initialze Network Manager and cache manager here
    /// - Parameters: For Testing Purpose mocked `networkManger`
    /// can be injected into this viewModel
    ///   - networkManger: Fetch result from Api
    init(with networkManger: ServiceProtocol = NetworkManager.shared()) {
        self.networkManger = networkManger
    }
    
    func fetchAllBank() -> AnyPublisher<GetBanksModel, Error> {
        let result: AnyPublisher<GetBanksModel, Error> = networkManger.makeReques(url: SeerBitURLs.get_banks,method: .get, parameters: nil)
        return result
    }
    
    func initiateTransfer(value: InitiateTransfer) -> AnyPublisher<TransferModel1, Error> {
        let result: AnyPublisher<TransferModel1, Error> = networkManger.makeReques(url: SeerBitURLs.post_initiate_transfer, method: .post, parameters: [
            "fullName": value.fullName,
            "mobileNumber": value.mobileNumber,
            "email": value.email,
            "publicKey": value.publicKey,
            "amount": value.amount,
            "currency": value.currency,
            "country": value.country,
            "paymentReference": value.paymentReference,
            "productId": value.productID,
            "productDescription": value.productDescription,
            "paymentType": value.paymentType,
            "channelType": value.channelType,
            "deviceType": value.deviceType,
            "sourceIP": value.sourceIP,
            "source": value.source,
            "fee": value.fee,
            "retry": value.retry,
            "amountControl": value.amountControl,
            "walletDaysActive": value.walletDaysActive,
            "bankCode": value.bankCode])
        return result
    }
    
    func initiateUSSD(value: InitiateUSSD) -> AnyPublisher<USSDModel, Error> {
        let result: AnyPublisher<USSDModel, Error> = networkManger.makeReques(url: SeerBitURLs.post_initiate_USSD, method: .post, parameters: [
            "fullName": value.fullName,
            "mobileNumber": value.mobileNumber,
            "email": value.email,
            "publicKey": value.publicKey,
            "amount": value.amount,
            "currency": value.currency,
            "country": value.country,
            "paymentReference": value.paymentReference,
            "productId": value.productID,
            "productDescription": value.productDescription,
            "redirectUrl": value.redirectURL,
            "paymentType": value.paymentType,
            "channelType": value.channelType,
            "ddeviceType": value.ddeviceType,
            "sourceIP": value.sourceIP,
            "source": value.source,
            "fee": value.fee,
            "retry": value.retry,
            "bankCode": value.bankCode
        ])
        return result
    }
    
    func initiateMomo() -> AnyPublisher<[MomoModel], Error> {
        let result: AnyPublisher<[MomoModel], Error> = networkManger.makeReques(url: SeerBitURLs.get_momo_networks, method: .get, parameters: nil)
        return result
    }
    
    func initiateCards(value: InitiateCards) -> AnyPublisher<CardModel, Error> {
        let result: AnyPublisher<CardModel, Error> = networkManger.makeReques(url: SeerBitURLs.post_initiate_card_live, method: .post, parameters: [
            "fullName" : value.fullName,
            "mobileNumber": value.mobileNumber,
            "email": value.email,
            "publicKey" : value.publicKey,
            "amount": value.amount,
            "currency": value.currency,
            "country": value.country,
            "paymentReference": value.paymentReference,
            "productId": value.productID,
            "redirectURL": value.redirectURL,
            "paymentType": value.paymentType,
            "channelType": value.channelType,
            "deviceType": value.deviceType,
            "sourceIP": value.sourceIP,
            "cardNumber": value.cardNumber,
            "cvv": value.cvv,
            "expiryMonth": value.expiryMonth,
            "expiryYear": value.expiryYear,
            "source": value.source,
            "fee": value.fee,
            "pin": value.pin,
            "retry": value.retry,
            "rememberMe": value.rememberMe,
            "isCardInternational": value.isCardInternational
        ])
        return result
    }
    
    
    
}
