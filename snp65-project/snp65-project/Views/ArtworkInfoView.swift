//
//  ArtworkInfoView.swift
//  snp65-project
//
//  Created by Sireethorn on 9/12/2565 BE.
//

import SwiftUI
import Kingfisher

struct ArtworkInfoView: View {
    
    //var artworkinfo : Artworkinfo
    var artwork : Artwork
   


    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 4){
                secAtwImg
                secBtnPlay
                VStack(alignment: .leading,spacing: 4){
                    secAtwDesc
                }.padding()
                    .padding(.top,-24)
            }
        }
           
    }
    private var secBtnPlay: some View {
        
        Button {
            print("Button Play")
        } label: {
            NavigationLink(destination:ArtworkPlayView(artwork: artwork)){
                HStack {
                    Spacer()
                    Text(" \(Image(systemName: "play.fill"))  More Experience")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(width: 360,height: 48)
                        .font(.semiSub)
                    Spacer()
                }.background(Color.primaryColor1)
            }.cornerRadius(24)
                .padding()
        }
    }
    
    
    private var secAtwImg: some View {
        VStack(alignment:.center){
            KFImage(URL(string: artwork.imgdesc))
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 8,style: .continuous))
                .background(Color.secondaryColor2)
                .shadow(color:Color.black.opacity(0.2),radius: 3,x:0,y:2)
                .padding()
        }
    } // Section Image Artwork
    
    private var secAtwDesc: some View {
        VStack(alignment:.leading,spacing: 8){
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
            
            VStack(alignment:.leading,spacing: 8){
                Text("Description")
                .foregroundColor(.black)
                .font(.titleNormalText)
                
                Text(artwork.desc)
                    .font(.normalText)
                    .foregroundColor(.secondary)
        }
        
        }
    }
}

struct ArtworkInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkInfoView(artwork: Artwork(id: "" , exhbtid: "", name: "", artist: "", type: "", desc: "", imgcover: "", imgdesc: "", sound: "", uuidbeacon: "", majorbeacon: 0, minorbeacon: 0, headexhbt: ""))
    }
}
