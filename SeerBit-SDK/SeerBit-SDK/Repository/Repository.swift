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
        let result: AnyPublisher<GetBanksModel, Error> = networkManger.makeReques(url: "/checkout/banks",method: .get)
        return result
    }
}
