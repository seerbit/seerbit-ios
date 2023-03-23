//
//  ConfirmPaymentView.swift
//  SeerBit-SDK
//
//  Created by Princess on 22/03/2023.
//

import SwiftUI

struct ConfirmPaymentView: View {
    @ObservedObject var viewModel: BankViewModel
    @State var value : Float = 0
    
    var body: some View {
        VStack {
            HeaderView(userName: viewModel.userName, userEmail: viewModel.userEmail)
                .padding(.top, 40)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(viewModel.currencyToPayIn) \(viewModel.amountToPay.delimiter)")
                        .bold()
                        .font(.system(size: 30))
                        .padding(.top)
                    
                    HStack {
                        Text("surcharge")
                            .font(.system(size: 15))
                        Text("\(viewModel.currencyToPayIn) \(viewModel.surchageFee.delimiter)")
                            .font(.system(size: 15))
                    }
                }
                Spacer()
            }
            .padding(.leading)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Hold on tight while we confirm this payment")
                        .padding([.top, .bottom])
                    Spacer()
                }
                .padding(.leading)
            }
            
            LoadingProgressBar()
                .padding([.leading, .trailing])
            
            Spacer()
        }
    }
}

struct ConfirmPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPaymentView(viewModel: BankViewModel())
    }
}
