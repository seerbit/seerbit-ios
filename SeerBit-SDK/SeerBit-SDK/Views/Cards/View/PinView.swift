//
//  PinView.swift
//  SeerBit-SDK
//
//  Created by Princess on 13/03/2023.
//

import SwiftUI

struct PinView: View {
    @ObservedObject var viewModel: CardViewModel
    var completed: (_ pin: String) -> Void = { _ in }
    
    var body: some View {
        VStack {
            HeaderView(userName: "Tola Sambo", userEmail: "omotola.sambo@seerbit.om")
                .padding(.top, 20)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("$\(viewModel.amountToPay.delimiter)")
                        .bold()
                        .font(.system(size: 30))
                        .padding(.top)
                        
                    HStack {
                        Text("surcharge")
                            .font(.system(size: 15))
                        Text("$\(viewModel.surchageFee.delimiter)")
                    }
                }
               Spacer()
            }
            .padding(.leading)
           
            Text("Enter your 4-digit card pin to authorize this payment")
                .padding()
                .multilineTextAlignment(.center)
            
            PassCodeView(type: .pin) { pin in
                if pin.count == 4 {
                    completed(pin)
                }
            
            }
            Spacer()
        }
    }
}

struct PinView_Previews: PreviewProvider {
    static var previews: some View {
        PinView(viewModel: CardViewModel())
    }
}
