//
//  ArtworkPlayBeacon.swift
//  snp65-project
//
//  
//

import SwiftUI
import Kingfisher
import AVFoundation
import AVFAudio
import Firebase

struct ArtworkPlayBeacon: View {
    
    var artwork : Artwork
    @State var playing = false
    @State private var playerPaused = true
    
    var body: some View {
        ScrollView{
            VStack{
                secAtwImg
                secDesc
                secBtnPlay
            }
        }
    }
    
    private var secAtwImg: some View {
        VStack(alignment:.center){
            KFImage(URL(string: artwork.imgdesc))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 8,style: .continuous))
                .background(Color.secondaryColor2)
                .shadow(color:Color.black.opacity(0.2),radius: 3,x:0,y:2)
                .padding()
        }
    } // Section Image Artwork
    
    
    private var secDesc: some View{
        VStack(alignment: .center, spacing: 8){
            Text(artwork.name)
                .font(.medHeading)
                .font(.title)
            Text("Artist: \(artwork.artist)")
                .font(.normalText)
               
        }
    } // Description
    
    private var secBtnPlay: some View {
        Button {
            togglePlayPause()
        } label: {
            HStack {
            Spacer()
                Text((Image(systemName: playing ? "pause.circle.fill" : "play.circle.fill")))
                    .font(.system(size: 60))
                    .foregroundColor(.primaryColor1)
                    .padding(.vertical, 10)
                    Spacer()
                    }
        }.cornerRadius(24)
        .padding()
    } //secBtnPlay
    
    final class SoundPlayer {
        
        static var share = SoundPlayer()
        private var player = AVPlayer()
        
        private init() {}
        
        func play(url: URL){
            player = AVPlayer(url: url)
            player.allowsExternalPlayback = true
            player.appliesMediaSelectionCriteriaAutomatically = true
            player.volume = 1
            player.play()
        }
        
        func pause(url:URL){
            player.pause()
        }
        
    } //SoundPlayer setting
    
    func soundPlaying() {
        SoundPlayer.share.play(url:.init(string: artwork.sound)!)
    } // SoundPlayer Playing
    
    func soundPause(){
        SoundPlayer.share.pause(url:.init(string: artwork.sound)!)
    } // SoundPlayer Pause
    
    
    private func pausePlayer(_ pause: Bool) {
          playerPaused = pause
          if playerPaused {
              soundPause()
              playing = false
          }
          else {
              soundPlaying()
              playing = true
          }
      } // condition sound playing
    
    private func togglePlayPause() {
        pausePlayer(!playerPaused)
    } // call function toggleplay
    
    
}

struct ArtworkPlayBeacon_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkPlayBeacon(artwork: Artwork(id:"", exhbtid: "", name: "", artist: "", type: "", desc: "", imgcover: "", imgdesc: "", sound: "", uuidbeacon: "", majorbeacon: 0, minorbeacon: 0, headexhbt: ""))
    }
}
