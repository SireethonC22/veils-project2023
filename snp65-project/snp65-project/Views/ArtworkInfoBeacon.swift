//
//  ArtworkInfoBeacon.swift
//  snp65-project
//
//
//

import AVFAudio
import AVFoundation
import Firebase
import FirebaseFirestoreSwift
import Kingfisher
import SwiftUI

struct ArtworkInfoBeacon: View {
    var artwork: Artwork
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var showingAlert = false
    @State var playing = false
    @State private var playerPaused = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                imgartwork
                secBtnPlay
                VStack(alignment: .leading, spacing: 4) {
                    secAtwDesc
                }.padding()
                    .padding(.top, -24)
                getCollect
            }
        }
    }

    private var imgartwork: some View {
        VStack(alignment: .center) {
            KFImage(URL(string: artwork.imgdesc))
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .background(Color.secondaryColor2)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                .padding()
        }
    } // Section Image Cover

    private var secAtwDesc: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(artwork.name)
                .foregroundColor(.black)
                .font(.medHeading)
                .font(.title)

            Text(artwork.artist)
                .foregroundColor(.black)
                .font(.titleNormalText)

            Text(artwork.type)
                .font(.normalText)
                .foregroundColor(.secondary)

            Divider()

            VStack(alignment: .leading, spacing: 8) {
                Text("Description")
                    .foregroundColor(.black)
                    .font(.titleNormalText)

                Text(artwork.desc)
                    .font(.normalText)
                    .foregroundColor(.secondary)
            }
        }
    } // Section Description

//    private var secBtnPlay: some View {
//
//        Button {
//            print("Button Play")
//        } label: {
//            NavigationLink(destination:ArtworkPlayBeacon(artwork: artwork)){
//                HStack {
//                    Spacer()
//                    Text(" \(Image(systemName: "play.fill"))  More Experience")
//                        .foregroundColor(.white)
//                        .padding(.vertical, 10)
//                        .font(.semiSub)
//                    Spacer()
//                }.background(Color.primaryColor1)
//            }.cornerRadius(24)
//                .padding()
//        }
//    } // section play sound

    private var secBtnPlay: some View {
        Button {
            togglePlayPause()
        } label: {
            NavigationLink(destination: ArtworkPlayBeacon(artwork: artwork)) {
                HStack {
                    Spacer()
                    Text(" \(Image(systemName: playing ? "pause.circle.fill" : "play.circle.fill"))  More Experience")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(width: 360, height: 48)
                        .font(.semiSub)
                    Spacer()
                }.background(Color.primaryColor1)
            }.cornerRadius(24)
                .padding()
        }
    } // section play sound modified

    final class SoundPlayer {
        static var share = SoundPlayer()
        private var player = AVPlayer()

        private init() {}

        func play(url: URL) {
            player = AVPlayer(url: url)
            player.allowsExternalPlayback = true
            player.appliesMediaSelectionCriteriaAutomatically = true
            player.volume = 1
            player.play()
        }

        func pause(url: URL) {
            player.pause()
        }
    } // SoundPlayer setting

    func soundPlaying() {
        SoundPlayer.share.play(url: .init(string: artwork.sound)!)
    } // SoundPlayer Playing

    func soundPause() {
        SoundPlayer.share.pause(url: .init(string: artwork.sound)!)
    } // SoundPlayer Pause

    private func pausePlayer(_ pause: Bool) {
        playerPaused = pause
        if playerPaused {
            soundPause()
            playing = false
        } else {
            soundPlaying()
            playing = true
        }
    } // condition sound playing

    private func togglePlayPause() {
        pausePlayer(!playerPaused)
    } // call function toggleplay

    private var getCollect: some View {
        Button {
            showingAlert.toggle()
        } label: {
            Text("Get Collection")
                .font(.medSubHeading)
                .foregroundColor(.primaryColor1)
                .padding(.vertical, 10)
                .frame(width: 360, height: 48)
                .overlay(Capsule(style: .continuous).stroke(Color.primaryColor1, lineWidth: 1))
                //                    .background(Color.primaryColor1)
                //                    .clipShape(Capsule())
                .padding()
        }.shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 0)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Get Artwork!"),
//                      message: Text("You can be view Artwork at the Collection Menu."), dismissButton: .default(Text("OK")))
                      message: Text("You find nearest Artwork, Get More Information 🖼️"),

                      primaryButton: .default(Text("Keep Collection")) {
                          // OK action
                        saveFav()
                      }, secondaryButton: .cancel(Text("Later")) {
                          // Cancel action
                      
                      }
                      )}
    }

    private func saveFav() {
        let data = ["uid": authViewModel.currentUser?.id,
                    "artworkid": artwork.id]

        let db = Firestore.firestore()
        db.collection("collections").document().setData(data as [String: Any]) { _ in
            print("debug: save artwork collection")
        }
    } // Save Fav
    }


struct ArtworkInfoBeacon_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkInfoBeacon(artwork: Artwork(id: "", exhbtid: "", name: "", artist: "", type: "", desc: "", imgcover: "", imgdesc: "", sound: "", uuidbeacon: "", majorbeacon: 0, minorbeacon: 0, headexhbt: ""))
    }
}
