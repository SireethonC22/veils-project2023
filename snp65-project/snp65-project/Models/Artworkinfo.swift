//
//  Artworkinfo.swift
//  snp65-project
//
//  Created by Sireethorn on 9/12/2565 BE.
//

import Foundation
struct Artworkinfo : Identifiable {
    
    var id : Int
    var atwName : String
    var atwArtist : String
    var ateCate : String
    var atwDesc : String
    var atwSound : String
    var atwImg : String
    var idExhbt : Int
    
}

var latestArtworkInfo = [
    Artworkinfo(id: 0,
                atwName: "Anthropocene",
                atwArtist: "Sirawich",
                ateCate: "Painting",
                atwDesc: "It is a long established fact that a reader will be distracted by the readable content",
                atwSound: "mp4",
                atwImg: "AnthropoceneCover",
                idExhbt: 0),
    
    Artworkinfo(id: 1,
                atwName: "Anthropocene",
                atwArtist: "Sirawich",
                ateCate: "Painting",
                atwDesc: "It is a long established fact that a reader will be distracted by the readable content",
                atwSound: "mp4",
                atwImg: "AnthropoceneCover",
                idExhbt: 0),
    
    Artworkinfo(id: 2,
                atwName: "Anthropocene",
                atwArtist: "Sirawich",
                ateCate: "Painting",
                atwDesc: "It is a long established fact that a reader will be distracted by the readable content",
                atwSound: "mp4",
                atwImg: "AnthropoceneCover",
                idExhbt: 0),
    
    Artworkinfo(id: 3,
                atwName: "นิราษฎร์",
                atwArtist: "Sirawich",
                ateCate: "Book",
                atwDesc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal",
                atwSound: "mp4",
                atwImg: "nirajCover",
                idExhbt: 1),
    
    Artworkinfo(id: 4,
                atwName: "นิราษฎร์",
                atwArtist: "Sirawich",
                ateCate: "Book",
                atwDesc: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal",
                atwSound: "mp4",
                atwImg: "nirajCover",
                idExhbt: 1),
]
