//
//  ErrowPopUp.swift
//  SeerBit-SDK
//
//  Created by Princess on 31/03/2023.
//

import SwiftUI

struct ErrowPopUp: View {
   // var close: () -> Void = { }
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Transaction Failed")
                    .foregroundColor(Color.red)
                    .fontWeight(.heavy)
                Text("Transaction Timeout. Please reload checkout")
                    .font(.system(size: 14))
                    .foregroundColor(Color.red)
            }
            .padding(5)
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color.red)
                .frame(width: 20, height: 20)
                .padding(.trailing, 5)
            }
             
        }
        .padding(5)
        .background(Color(uiColor: ImageProvider.color(named: "errorBackground") ?? UIColor()))
        .cornerRadius(5)
        .padding([.leading, .trailing])
        
        
    }
}

struct ErrowPopUp_Previews: PreviewProvider {
    static var previews: some View {
        ErrowPopUp()
    }
}
