//
//  ProfileView.swift
//  snp65-project
//
//  Created by Sireethorn on 23/12/2565 BE.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel

    
    var body: some View {
     
            ScrollView{
                
                if let user = authViewModel.currentUser  {
                    
                    VStack{
                   
                        VStack(alignment: .leading){
                            HStack{ Spacer() }
                            Text("Profile")
                                .font(.custom("BaiJamjuree-Semibold", size: 32))
                        }
                        .padding(.leading)
                        .foregroundColor(.secondaryColor1)
                        
                        
                        VStack(alignment: .leading){
                            
                            // Email
                            VStack(alignment: .leading){
                                Text("E-mail")
                                    .font(.titleNormalText)
                                    .foregroundColor(.gray)
                                
                                Text(user.email)
                                    .padding(.top,4)
                                    .font(.titleNormalText)
                                    .foregroundColor(.primaryColor1)
                                Divider()
                                    .background(Color.secondaryColor2)
                            }
                            
                            // Username
                            VStack(alignment: .leading){
                                Text("Username")
                                    .font(.titleNormalText)
                                    .foregroundColor(.gray)
                                
                                Text(user.username)
                                    .padding(.top,4)
                                    .font(.titleNormalText)
                                    .foregroundColor(.primaryColor1)
                                Divider()
                                    .background(Color.secondaryColor2)
                            } .padding(.top,16)
                            
                            // Fullname
                            VStack(alignment: .leading){
                                Text("Fullname")
                                    .font(.titleNormalText)
                                    .foregroundColor(.gray)
                                
                                Text(user.fullname)
                                    .padding(.top,4)
                                    .font(.titleNormalText)
                                    .foregroundColor(.primaryColor1)
                                Divider()
                                    .background(Color.secondaryColor2)
                            } .padding(.top,16)
                            
                            
                            // Fullname
                            VStack(alignment: .leading){
                                Text("Lastname")
                                    .font(.titleNormalText)
                                    .foregroundColor(.gray)
                                
                                Text(user.lastname)
                                    .padding(.top,4)
                                    .font(.titleNormalText)
                                    .foregroundColor(.primaryColor1)
                                Divider()
                                    .background(Color.secondaryColor2)
                            } .padding(.top,16)
                            
                        } .padding()
                        Spacer()
                        
                        // button log out
                        Button{
                            authViewModel.logOut()
                        } label: {
                            Text ("Log Out")
                                .font(.medSubHeading)
                                .foregroundColor(.primaryColor1)
                                .frame(width: 360,height: 48)
                                .overlay(Capsule(style: .continuous).stroke(Color.primaryColor1,lineWidth: 1))
                            //                    .background(Color.primaryColor1)
                            //                    .clipShape(Capsule())
                                .padding()
                        }.shadow(color: .gray.opacity(0.5), radius: 5,x: 0,y: 0)
                    }
                }
            }
            
    }

    
    
    private var userEmail : some View {
        VStack(alignment: .leading){
            Text("E-mail")
                .font(.titleNormalText)
                .foregroundColor(.gray)

            Text("Your Email")
                .padding(.top,4)
                .font(.titleNormalText)
                .foregroundColor(.primaryColor1)
            Divider()
                .background(Color.secondaryColor2)
        }
    }
    
    private var userName : some View {
        VStack(alignment: .leading){
            Text("Username")
                .font(.titleNormalText)
                .foregroundColor(.gray)

            Text("Your Username")
                .font(.titleNormalText)
                .foregroundColor(.primaryColor1)
                .padding(.top,4)
            Divider()
                .background(Color.secondaryColor2)
        }
    }
    
    private var userFullName : some View {
        VStack(alignment: .leading){
            Text("Fullname")
                .font(.titleNormalText)
                .foregroundColor(.gray)

            Text("Your Fullname")
                .font(.titleNormalText)
                .foregroundColor(.primaryColor1)
                .padding(.top,4)
            Divider()
                .background(Color.secondaryColor2)
        }
    }
    
    private var userLastname : some View {
        VStack(alignment: .leading){
            Text("Lastname")
                .font(.titleNormalText)
                .foregroundColor(.gray)

            Text("Your Lastname")
                .font(.titleNormalText)
                .foregroundColor(.primaryColor1)
                .padding(.top,4)
            Divider()
                .background(Color.secondaryColor2)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
