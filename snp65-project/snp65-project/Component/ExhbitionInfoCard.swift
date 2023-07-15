//
//  ExhbitionInfoCard.swift
//  snp65-project
//
//

import SwiftUI
import Kingfisher


struct ExhbitionInfoCard: View {
    
    var exhibition: Exhibition
    
//    var exhibitionInfo : ExhibitionInfo
    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                KFImage(URL(string: exhibition.imgcover))
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode:.fill)
                    .frame(height: 220)
                    .frame(maxWidth: UIScreen.main.bounds.width - 80)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
            }
        
            VStack(spacing:8){
                
                HStack{
                    Text(exhibition.exhbtname)
                        .font(.semiTitle)
                    .multilineTextAlignment(.leading)
                    .font(.title2.bold())
                    .foregroundColor(.primaryColor1)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(4)
                    
                    Spacer()
                    
                    Text(exhibition.exhbtstate)
                        .font(.medSubHeading)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 34, alignment: .center)
                        .background(Color.secondaryColor1)
                        .cornerRadius(24)
                    
                }
                
                HStack{
                    Label {
                        Text("\(exhibition.exhbtstr) - \(exhibition.exhbtend)")
                            .font(.normalText)
                            .font(.subheadline)
                            .foregroundColor(.NormalText)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(4)
                    } icon: {
                        Image("calendar-second")
                            .foregroundColor(.secondaryColor1)
                    }

                    
              
                    Spacer()
                    

                }
                
                HStack{
                    
                    Label {
                        Text("Open: \(exhibition.timestr) - Close: \(exhibition.timeend)")
                            .font(.normalText)
                            .font(.subheadline)
                            .foregroundColor(.NormalText)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(4)
                    } icon: {
                        Image(systemName: "timer")
                            .foregroundColor(.secondaryColor1)
                    }
                    
                    Spacer()
                }
                
                HStack{

            
                    Label {
                        Text(exhibition.loctname)
                            .font(.normalText)
                            .font(.subheadline)
                            .foregroundColor(.NormalText)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(4)
                    } icon: {
                        Image(systemName: "location.fill")
                            .foregroundColor(.secondaryColor1)
                    }
                    
                    Spacer()
                }
                
                
                
            }.frame(height: 120)
                .padding(.top,8)
        } //Vstack
        .padding(16)
        .background(.white)
        .frame(maxWidth: UIScreen.main.bounds.width - 50,alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
        .shadow(color: .black.opacity(0.1),radius: 8,x: 0,y: 5)
       
    }
}





struct ExhbitionInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        let exhibition = Exhibition(id: "", exhbtstate: "", exhbtname: "", exhbtstr: "", exhbtend: "", exhbtdesc: "", timestr: "", timeend: "", exhbtorgnz: "", loctname: "", loctdetail: "", ticket: "", imgcover: "")
        ExhbitionInfoCard(exhibition: exhibition)
    }
}
