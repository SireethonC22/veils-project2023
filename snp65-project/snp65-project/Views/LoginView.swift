//
//  LoginView.swift
//  snp65-project
//
//  
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                HStack{ Spacer() }
                Text("Welcome Back")
                    .font(.custom("BaiJamjuree-Semibold", size: 32))
                
                Text("Name Application")
                    .font(.custom("BaiJamjuree-Medium", size: 32))
            }
            .frame(height: 260)
            .padding(.leading)
//            .background(Color.secondaryColor2)
            .foregroundColor(Color.secondaryColor1)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            VStack(spacing: 40){
                CustomInputField(placeholderText: "Email", text: $email)
                
                CustomInputField(placeholderText: "Password",isSecureField:true,text: $password)
            }.padding()
            .padding(.top,48)
            
            Button{
                authViewModel.login(withEmail: email, password: password)
            } label: {
                Text ("Log In")
                    .font(.medSubHeading)
                    .foregroundColor(.white)
                    .frame(width: 360,height: 48)
                    .background(Color.primaryColor1)
                    .clipShape(Capsule())
                    .padding()
            }.shadow(color: .gray.opacity(0.5), radius: 5,x: 0,y: 0)
            
            Spacer()
            
            NavigationLink {
                SignUpView()
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Don't Have an account?")
                        .font(.subNormalText)
                        .foregroundColor(.primaryColor1)
                    Text("Sign Up")
                        .font(.medSubHeading2)
                        .foregroundColor(.secondaryColor1)
                }
            }.padding(.bottom,48)
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


