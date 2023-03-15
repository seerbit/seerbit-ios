//
//  HeaderView.swift
//  SeerBit-SDK
//
//  Created by Princess on 10/03/2023.
//

import SwiftUI

struct HeaderView: View {
    var userName: String
    var userEmail: String
    
    var body: some View {
        HStack {
            Image(uiImage: ImageProvider.image(named: "SeerbitLogo") ?? UIImage())
                .resizable()
                .frame(width: 40, height: 40)
            Spacer()
            VStack(alignment: .trailing, spacing: 12) {
                Text(userName)
                Text(userEmail)
                
            }
        }
        .padding([.leading, .trailing])
    }
    
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(userName: "Tola Sambo", userEmail: "omotola.sambo@seerbit.om")
    }
}



