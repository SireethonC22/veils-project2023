//
//  UpcomingInfoView.swift
//  snp65-project
//
//
//

import SwiftUI
import Kingfisher
import Firebase

struct UpcomingInfoView: View {
    
    var upcoming: Upcoming
    
    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                secImgCover
                VStack(alignment:.leading,spacing: 16){
                    secNameExhbt
                    secCalendarExhbt
                    secLocation
                    secTicket
                    Divider()
                    secAboutExhbt
                    Divider()
                    secOrganizer
                }.padding()
            }
            
        }.navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = false
            }
    }
    
    
    private var secImgCover: some View {
        VStack{
            KFImage(URL(string: upcoming.upcomImgCover))
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color:Color.black.opacity(0.2),radius: 3,x:2,y:2)
                .padding()
        }
    } // secImgCover
    
    private var secNameExhbt: some View {
        HStack{
            Text(upcoming.upcomName)
                .font(.medHeading)
                .font(.title)
                .fontWeight(.bold)
        }
    }// section Name Exhibition
    
    private var secCalendarExhbt: some View {
        HStack(spacing:16){
            Image("calendar")
                .frame(width: 32, height: 32, alignment: .center)
                .font(.system(size: 24,weight: .regular))
                .foregroundColor(.primaryColor1)
                .padding(8)
                .background(Color.primaryColor3)
                .cornerRadius(8)
            
            VStack(alignment:.leading){
                Text("\(upcoming.upcomStr) - \(upcoming.upcomEnd)")
                    .font(.titleNormalText)
                Text("\(upcoming.upcomTimeStr) - \(upcoming.upcomTimeEnd)")
                    .font(.normalText)
                    .foregroundColor(.secondary)
            }
        } // Calendar
    } // section Calendar
    
    private var secLocation: some View {
        HStack(spacing:16){
            Image("location")
                .frame(width: 32, height: 32, alignment: .center)
                .font(.system(size: 24,weight: .regular))
                .foregroundColor(.primaryColor1)
                .padding(8)
                .background(Color.primaryColor3)
                .cornerRadius(8)
            
            VStack(alignment:.leading){
                Text(upcoming.upcomLoct)
                    .font(.titleNormalText)
                Text(upcoming.upcomLoctDetail)
                    .font(.normalText)
                    .foregroundColor(.secondary)
            }
        } // Location
    } // section Location
    
    private var secTicket: some View {
        HStack(spacing:16){
            Image("tickersecond")
                .frame(width: 32, height: 32, alignment: .center)
                .font(.system(size: 24,weight: .regular))
                .foregroundColor(.primaryColor1)
                .padding(8)
                .background(Color.primaryColor3)
                .cornerRadius(8)
            
            VStack(alignment:.leading){
                Text(upcoming.upcomTicket)
                    .font(.titleNormalText)
                Text("Ticket")
                    .font(.normalText)
                    .foregroundColor(.secondary)
            }
        } // Ticket
    } // section Ticket
    
    private var secOrganizer: some View {
        HStack(spacing:16){
            Image("organizer")
                .frame(width: 32, height: 32, alignment: .center)
                .font(.system(size: 24,weight: .regular))
                .foregroundColor(.primaryColor1)
                .padding(8)
                .background(Color.primaryColor3)
                .cornerRadius(8)
            
            VStack(alignment:.leading){
                Text(upcoming.upcomOgrz)
                    .font(.titleNormalText)
                Text("Organizer")
                    .font(.normalText)
                    .foregroundColor(.secondary)
            }
        } // Organizer
    } // section Organizer
    
    private var secAboutExhbt: some View {
        NavigationLink(destination:UpcomingAboutView(upcoming: upcoming)){
            HStack{
                Text("About Exhibition")
                    .font(.titleNormalText)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondaryColor1)
            }
        }.buttonStyle(PlainButtonStyle())
            
        } // section About Exhibtion
    
    
} // Struct UpcomingInfoView


struct UpcomingInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let upcoming = Upcoming(id: "", upcomState: "", upcomName: "", upcomStr: "", upcomEnd: "", upcomTimeStr: "", upcomTimeEnd: "", upcomAbout: "", upcomOgrz: "", upcomLoct: "", upcomLoctDetail: "", upcomTicket: "", upcomImgCover: "")
        UpcomingInfoView(upcoming: upcoming)
    }
}
