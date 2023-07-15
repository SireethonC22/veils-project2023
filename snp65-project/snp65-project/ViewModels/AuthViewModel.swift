//
//  AuthViewModel.swift
//  snp65-project
//
//  Created by Sireethorn on 24/12/2565 BE.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth


class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    let userID = Auth.auth().currentUser?.uid
    @Published var currentUser: User?
    @Published var didAuthenicateUser = false
    private var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    
    // function user login
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print ("debug: login with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    
    // function user register (sign up)
    func register(withEmail email: String, password: String, fullname: String, lastname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error {
                print("debug: register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("debug: register sucessfully")
            
            let data = ["email": email,
                        "username":username,
                        "fullname":fullname,
                        "lastname":lastname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenicateUser = true
//                    print ("debug: upload user data")
                }
            
        }
    }
    
    func logOut() {
        userSession = nil
//         user sign out on server
        try? Auth.auth().signOut()
        
//        let firebaseAuth = Auth.auth()
//        do {
//          try firebaseAuth.signOut()
//        } catch let signOutError as NSError {
//          print("Error signing out: %@", signOutError)
//        }
    }
    
    
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user 
        }
    }
}
