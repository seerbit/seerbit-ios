//
//  USSDViewModel.swift
//  SeerBit-SDK
//
//  Created by Princess on 27/04/2023.
//

import Foundation
import UIKit
import Combine

class USSDViewModel: ObservableObject {
    private var publishers = Set<AnyCancellable>()
    private let repository: RequestProtocol!

    @Published var userName: String = "Tola Shimbo"
    @Published var userEmail: String = "omotola.sambo@seerbit.om"
    @Published var amountToTransfer: Double = 0.0
    @Published var currencyToPayIn: String = "NGN"
    @Published var surchageFee: Double = 0.0
    @Published var payments: USSDPayments?

    var request: URLRequest = {
        let url = URL(string: "https://seerbitapi.com/checkout/initiates")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }()

    init(with repository: RequestProtocol = Repository()) {
        self.repository = repository
    }

    func initiateUSSD() {
        repository.initiateUSSD(value: InitiateUSSD(fullName: "", mobileNumber: "", email: "", publicKey: "", amount: "", currency: "", country: "", paymentReference: "", productID: "", productDescription: "", redirectURL: "", paymentType: "", channelType: "", ddeviceType: "", sourceIP: "", source: "", fee: "", retry: true, bankCode: ""))
            .sink { error in
                print(error)
            } receiveValue: { result in
                self.payments = result.data.payments
            }
            .store(in: &publishers)
    }

}
