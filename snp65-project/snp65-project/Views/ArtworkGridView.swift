//
//  ArtworkGridView.swift
//  snp65-project
//
//  Created by Sireethorn on 9/12/2565 BE.
//

import SwiftUI
import Firebase

struct ArtworkGridView: View {
    //var artworkGV: [Artworkinfo]
    
    @StateObject var artwork = ArtworkViewModel()
    @StateObject var exhibition = ExhibitionViewModel()
    var id: String
    
    
    
    
    var body: some View {
        
        ScrollView{
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 4)],spacing: 4){
                //                ForEach (exhibition.exhibitions) { exhibition in
                
                ForEach(artwork.artworks){ artwork in
                    if id == artwork.exhbtid {
                        NavigationLink(destination:ArtworkInfoView(artwork: artwork)){
                            ArtworkInfoCard(artwork: artwork)
                        }
                    } else {
                        
                    }
                    
                }.onAppear() {
                    self.exhibition.fetchExhibitions()
                    self.artwork.fetchArtworks()
                }
                
            }
        }.padding()
        
        
        
    }
    
    
    
    
    struct ArtworkGridView_Previews: PreviewProvider {
        static var previews: some View {
            ArtworkGridView(id: "")
            //ArtworkGridView(artworkGV:latestArtworkInfo)
        }
    }
}
