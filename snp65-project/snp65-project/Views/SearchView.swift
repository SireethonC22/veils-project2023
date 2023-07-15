//
//  SearchView.swift
//  snp65-project
//
//  
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""
    @StateObject var exhibitionVM = ExhibitionViewModel()
    @State var searchExhbt = ""
    @State var isNavigationBarHidden: Bool = true
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{ Spacer() }
                Text("Discover")
                    .font(.custom("BaiJamjuree-Semibold", size: 28))
            }
            .padding(.leading)
            .padding(.bottom,-16)
            .foregroundColor(.secondaryColor1)
            VStack{
                secSearch
            }.padding()
                
        }
       
    }
    
    private var secListExhbt: some View {
        LazyVStack{
            ForEach(exhibitionVM.exhibitions, id: \.id){ post in
                ExhbitionInfoCard(exhibition: post)
            }.padding()
        }
    }
    
    private var secSearchBar: some View {
        HStack{
            HStack{
                TextField("\(Image(systemName: "magnifyingglass")) Search Exhibition or Location", text: $search)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color.primaryColor2, lineWidth: 1)
                    )
            }
            
            Image(systemName: "line.3.horizontal.decrease.circle")
                .foregroundColor(.primaryColor1)
                .frame(width: 16, height: 16, alignment: .center)
                .font(.system(size: 24,weight: .regular))
                .padding()
                .background(Color.primaryColor3)
                .cornerRadius(8)
            
        }.padding()
    } // Section Search Bar
    
    
    private var secSearch: some View {
        VStack{
            HStack{
                TextField("\(Image(systemName: "magnifyingglass")) Search Exhibition Name ", text: $search)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color.primaryColor2, lineWidth: 1)
                    )
            }
            
            VStack{
                ScrollView{
                    VStack{
                        ForEach(exhibitionVM.exhibitions.filter{(self.search.isEmpty ? true : $0.exhbtname.localizedStandardContains(self.search))},id:\.id){
                            exhibitionsearch in
                            NavigationLink(destination:ExhibitionInfoView(exhibition: exhibitionsearch)){
                                ExhbitionInfoCard(exhibition: exhibitionsearch)
                            }
                        }
                    }.padding()
                }
            }
        }
        
    } // Section Search Bar
    

    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
