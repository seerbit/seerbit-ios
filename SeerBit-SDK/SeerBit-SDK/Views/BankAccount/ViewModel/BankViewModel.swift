//
//  BankViewModel.swift
//  SeerBit-SDK
//
//  Created by Princess on 16/03/2023.
//

import Foundation
import UIKit
import Combine


class BankViewModel: ObservableObject {
    private var publishers = Set<AnyCancellable>()
    private let repository: RequestProtocol!
    
    @Published var amountToPay: Double = 0.0
    @Published var surchageFee: Double = 0.0
    @Published var currencyToPayIn: String = "NGN"
    @Published var userName: String = "Tola Shimbo"
    @Published var userEmail: String = "omotola.sambo@seerbit.om"
    @Published var bankSelected: MerchantBank? = nil
    @Published var bankCodeGenerated: String = "*737*000*99099#"
    @Published var momoNetworkSelected: MomoNetworks? = nil
    @Published var merchantBanks: [MerchantBank] = []
    
    init(with repository: RequestProtocol = Repository()) {
        self.repository = repository
    }
    
    func getAllBanks() {
        repository.fetchAllBank()
            .sink { error in
                print(error)
            } receiveValue: { result in
                self.merchantBanks = result.data.merchantBanks
            }
            .store(in: &publishers)
    }
    
}
