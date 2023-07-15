//
//  snp65_projectApp.swift
//  snp65-project
//
//
//

import SwiftUI
import Firebase
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct snp65_projectApp: App {
//    init(){
//        FirebaseApp.configure()
//    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {

            NavigationView{
                ContentView(artworkinfo: Artworkinfo(
                    id: 0,
                    atwName: "Anthropocene",
                    atwArtist: "Sirawich",
                    ateCate: "Painting",
                    atwDesc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal",
                    atwSound: "mp4",
                    atwImg: "AnthropoceneCover",
                    idExhbt: 0),exhibition:Exhibition(id: "", exhbtstate: "", exhbtname: "", exhbtstr: "", exhbtend: "", exhbtdesc: "", timestr: "", timeend: "", exhbtorgnz: "", loctname: "", loctdetail: "", ticket: "", imgcover: ""), artwork: ArtworkViewModel())
                
            } .environmentObject(authViewModel)
        }
    }
}
