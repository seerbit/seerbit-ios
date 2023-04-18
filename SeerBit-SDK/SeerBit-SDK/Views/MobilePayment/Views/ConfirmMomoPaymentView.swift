//
//  ConfirmMomoPaymentView.swift
//  SeerBit-SDK
//
//  Created by Princess on 18/04/2023.
//

import SwiftUI

struct ConfirmMomoPaymentView: View {
    @ObservedObject var viewModel: BankViewModel
    var body: some View {
        VStack {
            HeaderView(userName: viewModel.userName, userEmail: viewModel.userEmail)
                .padding(.top, 30)
            
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
            
            Image(uiImage: ImageProvider.image(named: "bellImage") ?? UIImage())
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 7)
            
            Text("Confirming your payment is taking longer than usual. We will keep checking for the status until this link expires. \n If for any reason you are debited and not given value. Email us at ")
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .padding([.top, .leading, .trailing])
            Text("support@seerbit.com")
                .padding(.top, 1)
                .onTapGesture {
                    //
                }
            Spacer()
        }
    }
}

struct ConfirmMomoPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmMomoPaymentView(viewModel: BankViewModel())
    }
}
