//
//  PrimaryButton.swift
//  SeerBit-SDK
//
//  Created by Princess on 13/03/2023.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    var width: CGFloat
    var height: CGFloat
    var validated: Bool = true
    var handler: () -> Void
   
    
  
    var body: some View {
        ZStack {
            Button(action: handler) {
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.system(size: 15))
            }
            .frame(width: width, height: height)
            .background(Color.black)
            .cornerRadius(5)
            .opacity(validated ? 1 : 0.6)
            .disabled(!validated)
            

        }
    }
}
//struct PrimaryButton_Previews: PreviewProvider {
//    static var previews: some View {
//        PrimaryButton(title: "Hello", width: 340, height: 50){}
//    }
//}

struct CustomButtonGray: View {
    let title: String
    var width: CGFloat
    var height: CGFloat
    var handler: () -> Void
  
    var body: some View {
        Button(action: handler) {
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(Color.black)
              
           
                
        }
        .frame(width: width, height: height)
        .background(Color(uiColor: ImageProvider.color(named: "secondaryButtonColor") ?? UIColor()))
        .cornerRadius(5)
    }
}

//struct CustomButtonGray_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomButtonGray(title: "skip", width: 320, height: 40){}
//            .previewLayout(.sizeThatFits)
//    }
//}

struct CustomButtonGray2: View {
    let title: String
    var width: CGFloat
    var height: CGFloat
    var handler: () -> Void
  
    var body: some View {
        Button(action: handler) {
            HStack {
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(Color.black)
                Spacer()
            }
            .padding(.leading)
           
                
        }
        .frame(width: width, height: height)
        .background(Color(uiColor: ImageProvider.color(named: "secondaryButtonColor") ?? UIColor()))
        .cornerRadius(5)
    }
}

struct CustomButtonGray2_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonGray2(title: "skip", width: 320, height: 40){}
            .previewLayout(.sizeThatFits)
    }
}



struct CustomButtonRed: View {
    let title: String
    var width: CGFloat
    var height: CGFloat
    var handler: () -> Void
  
    var body: some View {
        Button(action: handler) {
            Text(title)
                .font(.system(size: 15))
                .foregroundColor(Color.red)
                
        }
        .frame(width: width, height: height)
        .background(Color(uiColor: ImageProvider.color(named: "dangerButton") ?? UIColor()))
        .cornerRadius(5)
    }
}

//struct CustomButtonRed_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomButtonRed(title: "skip", width: 320, height: 40){}
//            .previewLayout(.sizeThatFits)
//    }
//}
