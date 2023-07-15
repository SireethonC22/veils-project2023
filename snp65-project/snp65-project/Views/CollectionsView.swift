//
//  CollectionsView.swift
//  snp65-project
//
//  Created by Sireethorn on 23/12/2565 BE.
//

import Firebase
import SwiftUI



struct CollectionsView: View {
    @StateObject var artwork = ArtworkViewModel()
    //    @EnvironmentObject var authViewModel: AuthViewModel
    let userID = Auth.auth().currentUser!.uid
    //    var collection: Collection
    @StateObject var collectionfetch = CollectionViewModel()
    


    var body: some View {
//        Text(userID)
        ScrollView {
            VStack(alignment: .leading){
                HStack{ Spacer() }
                Text("My Collection")
                    .font(.custom("BaiJamjuree-Semibold", size: 28))
            }
            .padding(.leading)
            .foregroundColor(.secondaryColor1)
            
            if collectionfetch.collections.isEmpty {
                // Display empty view (message)
              
                VStack{
                    Text("No collections found.")
                        .font(.custom("BaiJamjuree-Medium", size: 18))
                        .foregroundColor(.secondaryColor1.opacity(0.8))
                        .padding()
                        .padding(.bottom,-12)
                    Text("You can add")
                    
                        .font(.custom("BaiJamjuree-Regular", size: 12))
                        .foregroundColor(.secondaryColor1.opacity(0.8))
                    Text("your collection by visiting our exhibition.")
                        .font(.custom("BaiJamjuree-Regular", size: 12))
                        .foregroundColor(.secondaryColor1.opacity(0.8))
                }.padding(.top,240)
                    
                
            } else {
                // Display collections
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 4)], spacing: 4) {
                    ForEach(0 ..< collectionfetch.collections.count, id: \.self) { i in
                        if userID == collectionfetch.collections[i].uid {
                            ForEach(artwork.artworks) { artwork in
                                if collectionfetch.collections[i].artworkid == artwork.id {
                                    NavigationLink(destination: ArtworkInfoCollectView(artwork: artwork)) {
                                        ArtworkInfoCard(artwork: artwork)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        

             
    } // body

    struct CollectionsView_Previews: PreviewProvider {
        static var previews: some View {
            //        CollectionsView()
            CollectionsView()
        }
    }
}
