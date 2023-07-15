//
//  UpcomingCard.swift
//  snp65-project
//
//  Created by Sireethorn on 10/12/2565 BE.
//

import SwiftUI
import Kingfisher

struct UpcomingCard: View {
    
 
    var upcoming : Upcoming
    
    var body: some View {
        HStack(alignment: .center){
            KFImage(URL(string: upcoming.upcomImgCover))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140)
                .cornerRadius(8)
                .padding(.all,8)
            
            
            VStack(alignment:.leading,spacing: 6){
                
                HStack{
                    Text(upcoming.upcomName)
                        .font(.medSubHeading3)
                        .multilineTextAlignment(.leading)
                        .font(.title2.bold())
                        .foregroundColor(.primaryColor1)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(8)
                    
                }
                
                VStack{
                    Label {
                        Text(upcoming.upcomStr)
                            .font(.subNormalText)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(8)
                    } icon: {
                        Image(systemName: "calendar")
                            .foregroundColor(.secondaryColor1)
                    }
                }
                
                VStack{
                    Label {
                        Text("\(upcoming.upcomTimeStr) - \(upcoming.upcomTimeEnd)")
                            .font(.subNormalText)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(8)
                    } icon: {
                        Image(systemName: "timer")
                            .foregroundColor(.secondaryColor1)
                    }
                }
                
                VStack{
                    Label {
                        Text(upcoming.upcomLoct)
                            .font(.subNormalText)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(8)
                    } icon: {
                        Image(systemName: "location.fill")
                            .foregroundColor(.secondaryColor1)
                    }
                }
                
                
            }.padding(8)
            
        }   .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
            .shadow(color: .black.opacity(0.1),radius: 8,x: 4,y: 5)
            .padding(.trailing,4)
            .padding(.leading,4)
        
}
        
        struct UpcomingCard_Previews: PreviewProvider {
            static var previews: some View {
                let upcoming = Upcoming(id: "", upcomState: "", upcomName: "", upcomStr: "", upcomEnd: "", upcomTimeStr: "", upcomTimeEnd: "", upcomAbout: "", upcomOgrz: "", upcomLoct: "", upcomLoctDetail: "", upcomTicket: "", upcomImgCover: "")
                UpcomingCard(upcoming: upcoming)
     
            }
        }
    }

