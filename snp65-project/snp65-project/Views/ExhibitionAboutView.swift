//
//  ExhibitionAboutView.swift
//  snp65-project
//
//  
//

import SwiftUI

struct ExhibitionAboutView: View {
    var exhibition: Exhibition

    
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
            Text(exhibition.exhbtname)
                .font(.medTitle)
                .font(.title)
                .fontWeight(.bold)
                
        }
    }// section Name Exhibition
    
    private var secDesciption: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(exhibition.exhbtdesc)
                .font(.titleNormalText)
        }
    }// section Name Exhibition
}

struct ExhibitionAboutView_Previews: PreviewProvider {
    static var previews: some View {
        let exhibition = Exhibition(id: "", exhbtstate: "", exhbtname: "", exhbtstr: "", exhbtend: "", exhbtdesc: "", timestr: "", timeend: "", exhbtorgnz: "", loctname: "", loctdetail: "", ticket: "", imgcover: "")
        
        ExhibitionAboutView(exhibition: exhibition)
    }
}
