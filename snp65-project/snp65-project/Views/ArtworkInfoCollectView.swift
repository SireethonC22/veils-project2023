//
//  ArtworkInfoCollectView.swift
//  snp65-project
//
//
//

import Kingfisher
import SwiftUI

struct ArtworkInfoCollectView: View {
    var artwork: Artwork

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                artworkImage
                VStack(alignment: .leading, spacing: 4) {
                    artworkDescription
                }.padding()
                .padding(.top, -24)
//                removeArtwork
            }
        }
    }

    private var artworkImage: some View {
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
    } // Section Image Artwork

    private var artworkDescription: some View {
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
            Divider()
            VStack(alignment: .leading, spacing: 8) {
                Text("From Exhibition")
                    .foregroundColor(.black)
                    .font(.titleNormalText)
                
                Text(artwork.headexhbt)
                    .font(.normalText)
                    .foregroundColor(.secondary)
            }
        }
    } // Section Artwork Description

    private var removeArtwork: some View {
        Button {
            // Remove artwork
        } label: {
            Text("Remove Artwork")
                .font(.medSubHeading)
                .foregroundColor(.primaryColor1)
                .padding(.vertical, 10)
                .frame(width: 360, height: 48)
                .overlay(Capsule(style: .continuous).stroke(Color.primaryColor1, lineWidth: 1))

                .padding()
        }.shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 0)
    } // Section Remove Artwork
}

struct ArtworkInfoCollectView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkInfoCollectView(artwork: Artwork(id: "", exhbtid: "", name: "", artist: "", type: "", desc: "", imgcover: "", imgdesc: "", sound: "", uuidbeacon: "", majorbeacon: 0, minorbeacon: 0, headexhbt: ""))
    }
}
