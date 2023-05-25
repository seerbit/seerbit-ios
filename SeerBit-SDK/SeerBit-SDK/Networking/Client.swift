//
//  Client.swift
//  SeerBit-SDK
//
//  Created by Princess on 19/04/2023.
//

import Foundation

final class Client: GenericApi {

    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }
}
