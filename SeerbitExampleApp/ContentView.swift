//
//  ContentView.swift
//  SeerbitExampleApp
//
//  Created by Princess on 25/04/2023.
//

import SwiftUI
import SeerBit_SDK

struct ContentView: View {
    var body: some View {
        VStack {
            CreditCardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
