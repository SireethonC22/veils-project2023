//
//  ExhibitionInfoView.swift
//  snp65-project
//
//  
//

import SwiftUI
import Kingfisher
import Firebase

struct ExhibitionInfoView: View {
    var exhibition: Exhibition
    
    @StateObject var btnReminder = ExhibitionReminder()
    @State var isNavigationBarHidden: Bool = false
    @State var planVisit = Date()
    @State var selectedDate = Date()
    @State var showingAlert = false
    
    var body: some View {
     
            ScrollView{
                VStack() {
                    secImgCover
                    
                    VStack(alignment:.leading,spacing: 16){
                        secNameExhbt
                        secCalendarExhbt
                        secLocation
                        secTicket
                        
                        Divider()
                        secAboutExhbt
                        Divider()
                        secArtworks
                        Divider()
                        secOrganizer
                     
                    }.padding()

                    
//                    VStack(){
//                    Divider()
//                    secPlanVisit
//                    }.padding()
//                        .padding(.top,-24)
                        
                    
                    secBtnReminder
                }
            }.navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = false
            }
        
    }
    
    // Section View
    private var secImgCover: some View {
        VStack{
            KFImage(URL(string: exhibition.imgcover))
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color:Color.black.opacity(0.2),radius: 3,x:2,y:2)
                .padding()
        }
    }// section Image Cover
    
    private var secNameExhbt: some View {
        HStack{
            Text(exhibition.exhbtname)
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
                Text("\(exhibition.exhbtstr) - \(exhibition.exhbtend)")
                    .font(.titleNormalText)
                Text("\(exhibition.timestr) - \(exhibition.timeend)")
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
                Text(exhibition.loctname)
                    .font(.titleNormalText)
                Text(exhibition.loctdetail)
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
                Text(exhibition.ticket)
                    .font(.titleNormalText)
                Text("Ticket")
                    .font(.normalText)
                    .foregroundColor(.secondary)
            }
        } // Ticket
    } // section Ticket
    
    
    private var secAboutExhbt: some View {
        NavigationLink(destination:ExhibitionAboutView(exhibition: exhibition)){
            HStack{
                Text("About Exhibition")
                    .font(.titleNormalText)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondaryColor1)
            }
        }.buttonStyle(PlainButtonStyle())
            
        } // section About Exhibtion
        
        private var secArtworks: some View {
            NavigationLink(destination:ArtworkGridView(artwork: ArtworkViewModel(), id: exhibition.id)){
                HStack{
//                  Text(exhibition.id)
                    Text("View Artworks")
                        .font(.custom("BaiJamjuree-Regular", size: 18))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondaryColor1)
                }
            }.buttonStyle(PlainButtonStyle())
        } // section Artworks
        
        
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
                    Text(exhibition.exhbtorgnz)
                        .font(.titleNormalText)
                    Text("Organizer")
                        .font(.normalText)
                        .foregroundColor(.secondary)
                }
            } // Organizer
        } // section Organizer
        
        
        private var secBtnReminder: some View {
            Button {
                    btnReminder.getInfo(index: exhibition.id)
                    btnReminder.remindTapped()
                    showingAlert.toggle()
                
            } label: {
                HStack {
                    Spacer()
                    Text("Reminder Me")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .font(.custom("BaiJamjuree-SemiBold", size: 18))
                    Spacer()
                }.background(Color.primaryColor1)
            }.cornerRadius(24)
                .padding()
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Save Exhibition🗓️!"), message: Text("You can check it on your phone calendar."), dismissButton: .default(Text("OK")))
                    
                }
        }
    


        
        
        
        
    }
    
    
    struct ExhibitionInfoView_Previews: PreviewProvider {
        static var previews: some View {
            let exhibition = Exhibition(id: "", exhbtstate: "", exhbtname: "", exhbtstr: "", exhbtend: "", exhbtdesc: "", timestr: "", timeend: "", exhbtorgnz: "", loctname: "", loctdetail: "", ticket: "", imgcover: "")
            ExhibitionInfoView(exhibition: exhibition)
        }
    }

