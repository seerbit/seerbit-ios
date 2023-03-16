//
//  BVNView.swift
//  SeerBit-SDK
//
//  Created by Princess on 16/03/2023.
//

import SwiftUI

struct BVNView: View {
    @ObservedObject var viewModel: BankViewModel
    @State private var BVNNumber = ""
    let BVNLimit = 11
    
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
        
                HStack {
                    Text("Please enter your BVN")
                        .padding(.top, 25)
                    Spacer()
                }
                .padding(.leading)
            
            VStack {
                 TextField("11 digits bank verification number", text: $BVNNumber)
                    .onChange(of: BVNNumber, perform: { newValue in
                        limitText(BVNLimit)
                    })
                     .padding()
                     .border(Color.gray, width: 0.5)
                     .padding([.leading, .trailing, .bottom])
                     .keyboardType(.numberPad)
            }
            
            PrimaryButton(title: "Authorize", width: 365, height: 55, validated: false) {
                //
            }
            
            HStack {
                Image(uiImage: ImageProvider.image(named: "lockIcon") ?? UIImage())
                    .resizable()
                    .frame(width: 15, height: 20)
                Image(uiImage: ImageProvider.image(named: "Secured-by-SeerBit") ?? UIImage())
            }
            .padding(.top,25)
            Spacer()
        }
    }
    
    func limitText(_ upper: Int)  {
           if BVNNumber.count > upper {
               BVNNumber = String(BVNNumber.prefix(upper))
           }
       }

}

struct BVNView_Previews: PreviewProvider {
    static var previews: some View {
        BVNView(viewModel: BankViewModel())
    }
}
