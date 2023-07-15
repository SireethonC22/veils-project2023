//
//  SignUpView.swift
//  snp65-project
//
//  Created by Sireethorn on 23/12/2565 BE.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var lastname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                HStack{ Spacer() }
                Text("Get Start!")
                    .font(.custom("BaiJamjuree-Semibold", size: 32))
                
                Text("Create your account")
                    .font(.custom("BaiJamjuree-Medium", size: 32))
            }
            .frame(height: 260)
            .padding(.leading)
            .foregroundColor(.secondaryColor1)

            VStack(alignment: .leading,spacing:40) {
                CustomInputField(placeholderText: "E-maill", text: $email)
                  
                CustomInputField(placeholderText: "Username", text: $username)
                
                CustomInputField(placeholderText: "Fullname", text: $fullname)
                
                CustomInputField(placeholderText: "Lastname", text: $lastname)
                
                CustomInputField(placeholderText: "Password",isSecureField: true ,text: $password)
                
        
                
            }
            .padding()
            .padding(.top,-72)
            
            Button{
                authViewModel.register(withEmail: email, password: password, fullname: fullname, lastname: lastname, username: username)
            } label: {
                Text ("Sign Up")
                    .font(.medSubHeading)
                    .foregroundColor(.white)
                    .frame(width: 360,height: 48)
                    .background(Color.primaryColor1)
                    .clipShape(Capsule())
                    .padding()
            }.shadow(color: .gray.opacity(0.5), radius: 5,x: 0,y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.subNormalText)
                        .foregroundColor(.primaryColor1)
                    
                    Text("Log In")
                        .font(.medSubHeading2)
                        .foregroundColor(.secondaryColor1)
                }
            }.padding(.bottom,48)
            
        }.ignoresSafeArea()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
