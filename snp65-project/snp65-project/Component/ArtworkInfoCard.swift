//
//  ArtworkInfoCard.swift
//  snp65-project
//
//  Created by Sireethorn on 9/12/2565 BE.
//

import SwiftUI
import Kingfisher
import Firebase

struct ArtworkInfoCard: View {
    
    //var artworkinfo : Artworkinfo
    var artwork : Artwork

    var body: some View {
        VStack {
            KFImage(URL(string: artwork.imgcover))
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .background(Color.secondaryColor2)
            
      
        } .frame(width: 160,height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 3,x:0,y:2)
        .padding()
        
    }
}

struct ArtworkInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkInfoCard(artwork:Artwork(id: "", exhbtid: "", name: "", artist: "", type: "", desc: "", imgcover: "", imgdesc: "", sound: "", uuidbeacon: "", majorbeacon: 0, minorbeacon: 0, headexhbt: ""))
    }
}
