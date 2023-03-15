//
//  PassCodeView.swift
//  SeerBit-SDK
//
//  Created by Princess on 13/03/2023.
//

enum PinType {
    case otp
    case pin
}

import SwiftUI

struct PassCodeView: View {
        let type: PinType
        private var maxDigits: Int {
            return type == .otp ? 6 : 4
        }
       @State var pin: String = ""
       @State var isDisabled = false
       var spacing:CGFloat = 8
       var handler: (String) -> Void

       public var body: some View  {
           VStack(spacing: spacing) {
               ZStack {
                   pinDots
                   backgroundField
               }
               
           }
       }
    
        private var pinDots: some View {
            HStack {
                Spacer()
                ForEach(0..<maxDigits,id: \.self) { index in
                    ZStack {
                        
                        /// set first box to active when keyboard pops up
                        Image(uiImage: ImageProvider.image(named: "emptyPasswordBox") ?? UIImage())
                            .resizable()
                            .frame(width: 48, height: 48)
                        
                        /// set any selected box to active
                        if (index + 1) == pin.count {
                            Image(uiImage: ImageProvider.image(named: "password_fill") ?? UIImage())
                                .resizable()
                                .frame(width: 48, height: 48)
                        }
                        
                        Image(self.getDigits(at: index))
                            .resizable()
                            .frame(width: 48, height: 48)
                    }
                    .background(Color.white)
                    .cornerRadius(5)
                    Spacer()
                }
            }
            
        }
       
       private var backgroundField: some View {
           let boundPin = Binding<String>(get: { self.pin }, set: { newValue in
               self.pin = newValue
               self.submitPin()
           })
           
           return TextField("", text: boundPin,
                            onEditingChanged: { _ in
           }, onCommit: submitPin)
              .accentColor(.clear)
              .foregroundColor(.clear)
              .keyboardType(.numberPad)
       }

       
       private func submitPin() {
           guard !pin.isEmpty else {
               return
           }
           
           if pin.count <= maxDigits {
               isDisabled = true
               handler(pin)
              // hideKeyboard()
           }
           
           // this code is never reached under  normal circumstances. If the user pastes a text with count higher than the
           // max digits, we remove the additional characters and make a recursive call.
           if pin.count > maxDigits {
               pin = String(pin.prefix(maxDigits))
               submitPin()
           }
       }
       
        private func getDigits(at index: Int) -> String {
            if index >= self.pin.count {
                return "\(Image(uiImage: ImageProvider.image(named: "emptyPasswordBox") ?? UIImage()))"
               // return ""
            }
            return "\(Image(uiImage: ImageProvider.image(named: "password_fill") ?? UIImage()))"
            //return self.pin.digits[index].numberString
        }
    
}

struct PassCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PassCodeView(type: .pin) { _ in}
            .previewLayout(.sizeThatFits)
    }
}
