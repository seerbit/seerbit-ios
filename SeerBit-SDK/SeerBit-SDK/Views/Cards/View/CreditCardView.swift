//
//  CreditCardView.swift
//  SeerBit-SDK
//
//  Created by Princess on 10/03/2023.
//

import SwiftUI

struct CreditCardView: View {
    @ObservedObject var viewModel: CardViewModel
    @State private var cardNumber = ""
    @State private var expirationDate = ""
    @State private var cvvCode = ""
    var validateCardNumber = HelpingClass()
    @State private var text = ""
    let cardNumberLimit = 19
    var cardType: CardType = .MasterCard
    @State var checkColor: Color =  Color.green
    @State var unCheckColor: Color = Color.gray
   
    
    
    var body: some View {
        VStack {
            HeaderView(userName: viewModel.nameOfUser, userEmail: viewModel.emailOfUser)
                .padding(.top, 40)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(viewModel.currency) \(viewModel.amountToPay.delimiter)")
                        .bold()
                        .font(.system(size: 30))
                        .padding(.top)
                        
                    HStack {
                        Text("surcharge")
                            .font(.system(size: 15))
                        Text("\(viewModel.currency) \(viewModel.surchageFee.delimiter)")
                            .font(.system(size: 15))
                    }
                }
               Spacer()
            }
            .padding(.leading)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Debit/Credit Card Details")
                        .padding([.top, .bottom])
                    Spacer()
                }
                .padding(.leading)
            
                TextField("Card Number", text: $cardNumber)
                    .onChange(of: cardNumber) { newValue in
                        cardNumber = newValue.applyPattern()
                        limitText(cardNumberLimit)
                        //let cardType = validateCardNumber.checkCardNumber(input: cardNumber)
                    }
                    .padding()
                    .border(Color.gray, width: 0.5)
                    .padding([.leading, .trailing, .bottom])
                    .keyboardType(.numberPad)

                HStack {
                    TextField("MM/YY", text: $expirationDate)
                        .keyboardType(.numberPad)
                        .padding()
                        .border(Color.gray, width: 0.5)
                        .padding(.leading)
                        .onChange(of: expirationDate) { newValue in
                           // expirationDate = String(newValue.textField(textField: <#T##UITextField#>, shouldChangeCharactersInRange: <#T##NSRange#>, replacementString: <#T##String#>))
                        }
                    HStack{}
                    HStack {
                        TextField("CVV", text: $cvvCode)
                            .keyboardType(.numberPad)
                            .padding()
                            .padding(.trailing)
                        Image(uiImage: ImageProvider.image(named: "cardCVVlogo") ?? UIImage())
                            .resizable()
                            .frame(width: 25, height: 20)
                            .padding(.trailing, 7)
                    }
                    .overlay(RoundedRectangle(cornerRadius: 1).stroke(lineWidth: 0.2).foregroundColor(Color.black))
                    .padding(.trailing)
                   
                }
                
                HStack {
                    CheckBoxView(checked: $viewModel.rememberDevice,
                                 checkColor: $checkColor,
                                 unCheckColor: $unCheckColor)
                    .frame(width: 20, height: 20)
                    Text("Remember my information on this device")
                }
                .padding()
            }
            
            PrimaryButton(title: "Pay $\((viewModel.amountToPay + viewModel.surchageFee).delimiter)", width: 355, height: 55, validated: false) {
                //
            }
            .padding(.bottom, 5)
            
            HStack {
                CustomButtonGray(title: "Change Payment Method", width: 200, height: 55) {
                    //
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
    }
    
    func limitText(_ upper: Int)  {
           if cardNumber.count > upper {
               cardNumber = String(cardNumber.prefix(upper))
           }
       }
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView(viewModel: CardViewModel())
    }
}
