//
//  MomoViewModel.swift
//  SeerBit-SDK
//
//  Created by Princess on 27/04/2023.
//

import Foundation
import UIKit
import Combine

public class MomoViewModel: ObservableObject {
    private var publishers = Set<AnyCancellable>()
    private let repository: RequestProtocol!
    
    @Published var amountToPay: Double = 0.0
    @Published var surchageFee: Double = 0.0
    @Published var currencyToPayIn: String = "NGN"
    @Published var userName: String = "Tola Shimbo"
    @Published var userEmail: String = "omotola.sambo@seerbit.om"
    @Published var momoNetworkSelected: MomoModel? = nil
    @Published var momo: [MomoModel] = []
    
    init(with repository: RequestProtocol = Repository()) {
        self.repository = repository
    }
    
    func initiateMomo() {
        repository.initiateMomo()
            .sink { error in
                print(error)
            } receiveValue: { result in
                self.momo = result
            }
            .store(in: &publishers)
    }
    
}
