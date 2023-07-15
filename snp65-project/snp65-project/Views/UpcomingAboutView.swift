//
//  UpcomingAboutView.swift
//  snp65-project
//
//  Created by Sireethorn on 15/4/2566 BE.
//

import SwiftUI
import Firebase

struct UpcomingAboutView: View {
    var upcoming: Upcoming
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 8){
                secNameExhbt
                secDesciption
            }.padding()
        }
    }
    
    private var secNameExhbt: some View {
        VStack{
            Text(upcoming.upcomName)
                .font(.medTitle)
                .font(.title)
                .fontWeight(.bold)
                
        }
    }// section Name Exhibition
    
    private var secDesciption: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(upcoming.upcomAbout)
                .font(.titleNormalText)
        }
    }// section Name Exhibition
    
}

struct UpcomingAboutView_Previews: PreviewProvider {
    static var previews: some View {
        let upcoming = Upcoming(id: "", upcomState: "", upcomName: "", upcomStr: "", upcomEnd: "", upcomTimeStr: "", upcomTimeEnd: "", upcomAbout: "", upcomOgrz: "", upcomLoct: "", upcomLoctDetail: "", upcomTicket: "", upcomImgCover: "")
        UpcomingAboutView(upcoming: upcoming)
    }
}
