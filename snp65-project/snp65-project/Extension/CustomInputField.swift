//
//  CustomInputField.swift
//  snp65-project
//
//  Created by Sireethorn on 23/12/2565 BE.
//

import SwiftUI

struct CustomInputField: View {
    
    let placeholderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack{
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
            }
            Divider()
                .background(Color.secondaryColor1)
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(placeholderText: "Email",isSecureField: false ,text: .constant(""))
    }
}
