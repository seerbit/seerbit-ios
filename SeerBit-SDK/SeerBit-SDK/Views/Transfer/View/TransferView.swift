//
//  TransferView.swift
//  SeerBit-SDK
//
//  Created by Princess on 23/03/2023.
//

import SwiftUI

struct TransferView: View {
    @ObservedObject var viewModel: TransferViewModel = TransferViewModel()
    private let pasteboard = UIPasteboard.general
    
    //var model: Payments
    var body: some View {
        VStack {
            HeaderView(userName: viewModel.userName, userEmail: viewModel.userEmail)
                .padding(.top, 40)

            Text("Transfer the exact amount including decimals")
                    .padding(.top, 25)
                    .foregroundColor(Color.red)

            VStack {
                Text("\(viewModel.currencyToPayIn) \(viewModel.amountToTransfer.delimiter)")
                    .fontWeight(.heavy)
                    .font(.system(size: 30))
            }
            .frame(width: 210, height: 25)
            .padding()
            .background(Color(uiColor: ImageProvider.color(named: "secondaryButtonColor") ?? UIColor()))
            .cornerRadius(7)
            .padding(.bottom, 5)

            Text("to")
                .fontWeight(.heavy)
                .font(.system(size: 20))

            VStack(spacing: 12) {
                HStack {
                    Text("Account Number")
                        .font(.system(size: 17))
                    Spacer()
                    Text(viewModel.payments?.accountNumber ?? "")
                        .font(.system(size: 17))
                    Button {
                        pasteboard.string = viewModel.payments?.accountNumber ?? ""
                    } label: {
                        Image(uiImage: ImageProvider.image(named: "shareBtn") ?? UIImage())
                            .resizable()
                            .frame(width: 15, height: 20)
                    }
                }
                HStack {
                    Text("Bank")
                        .font(.system(size: 17))
                    Spacer()
                    Text(viewModel.payments?.bankName ?? "")
                        .font(.system(size: 17))
                }
                HStack {
                    Text("Beneficiary")
                        .font(.system(size: 17))
                    Spacer()
                    Text(viewModel.payments?.paymentReference ?? "")
                        .font(.system(size: 15))
                }

            }
            .frame(width: 330, height: 125)
            .padding()
            .background(Color(uiColor: ImageProvider.color(named: "secondaryButtonColor") ?? UIColor()))
            .cornerRadius(7)
            .padding(.bottom, 5)

            Text("Account Number can only be used once")
                .foregroundColor(Color.red)
                .padding(.bottom)

            PrimaryButton(title: "I have completed this bank transfer", width: 355, height: 55) {
                //viewModel.initiateTransfer()
            }
            
            HStack {
                CustomButtonGray(title: "Change Payment Method", width: 200, height: 55) {
                    viewModel.isPresenting = true
                }
                CustomButtonRed(title: "Cancel Payment", width: 150, height: 55) {
                    //
                }
            }
            .padding([.leading, .trailing])
            
            HStack {
                Image(uiImage: ImageProvider.image(named: "lockIcon") ?? UIImage())
                    .resizable()
                    .frame(width: 15, height: 20)
                Image(uiImage: ImageProvider.image(named: "Secured-by-SeerBit") ?? UIImage())
            }
            .padding(.top,25)

            Spacer()
        }
        .navigationDestination(
            isPresented: $viewModel.isPresenting) {
                  OtherPaymentChannelsView(viewModel: CardViewModel())
                  Text("")
                      .hidden()
             }

    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView(viewModel: TransferViewModel())
    }
}
