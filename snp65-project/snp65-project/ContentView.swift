//
//  ContentView.swift
//  detectorBeacon
//
//
//

import Combine
import CoreLocation
import SwiftUI

struct ContentView: View {
    @ObservedObject var detector = BeaconDetector()
    @EnvironmentObject var authViewModel: AuthViewModel

    @State var isNavigationBarHidden: Bool = true
    @State var isShowAlert = false
    @State var showDetail = false
    @State var isActive = false

    var artworkinfo: Artworkinfo
    var exhibition: Exhibition



    @StateObject var artwork = ArtworkViewModel()

    var body: some View {
        VStack {
            Group {
                if let userSession = authViewModel.userSession {
                    if detector.lastDistance == .immediate {
                        if !detector.beaconFound {
                            Text("")
                                .onAppear {
                                  
                                    isShowAlert = true
                                }
                                .alert(isPresented: $isShowAlert) {
                                    Alert(
                                        title: Text("Hi! Art Lovers"),
                                        message: Text("You find nearest Artwork, Get More Information 🖼️"),

                                        primaryButton: .default(Text("OK")) {
                                         
                                            showDetail = true
                                        }, secondaryButton: .cancel(Text("Later")) {
                                          
                                            showDetail = false
                                        }
                                    )
                                }
                        } else if let getArtwork = artwork.artworks.first(where: { $0.id == "1" }),
                                  getArtwork.uuidbeacon == BeaconDetector.getBeaconID() {
                            NavigationLink(destination: ArtworkInfoBeacon(artwork: getArtwork), isActive: $isActive) {
                                ArtworkInfoBeacon(artwork: getArtwork)
                            }
                            .hidden()
                            .onAppear {
                                isActive = true
                            }
                            .onDisappear {
                                isActive = false
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                showDetail = true
                            })
                        }
                    } else {
                        mainInterfaceView
                    }
                } else {
                  
                    LoginView()
                }
            }
        }
        .sheet(isPresented: $showDetail) {
            // present the ArtworkInfoBeacon view as a sheet
            if let getArtwork = artwork.artworks.first(where: { $0.id == "1" }),
               getArtwork.uuidbeacon == BeaconDetector.getBeaconID() {
                ArtworkInfoBeacon(artwork: getArtwork)
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(artworkinfo: Artworkinfo(
            id: 0,
            atwName: "Anthropocene",
            atwArtist: "Sirawich",
            ateCate: "Painting",
            atwDesc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal",
            atwSound: "mp4",
            atwImg: "AnthropoceneCover",
            idExhbt: 0), exhibition: Exhibition(id: "", exhbtstate: "", exhbtname: "", exhbtstr: "", exhbtend: "", exhbtdesc: "", timestr: "", timeend: "", exhbtorgnz: "", loctname: "", loctdetail: "", ticket: "", imgcover: ""), artwork: ArtworkViewModel())
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        VStack {
            MainTabView()
        }
    }
}
