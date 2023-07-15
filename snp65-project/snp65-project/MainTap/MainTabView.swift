//
//  MainTabView.swift
//  snp65-project
//
//  Created by Sireethorn on 23/12/2565 BE.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.primaryColor2)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "BaiJamjuree-Medium", size: 12)! ], for: .normal)
    }
    
    var body: some View {
        TabView(){
            
            HomeView()
            .tabItem{
                Text("Explore")
                    .font(.normalText)
                    Image(systemName: "magnifyingglass")
                }
            //HomeView
            CollectionsView()
           
            .tabItem{
                Text("Collection")
                    .font(.normalText)
                Image(systemName: "rectangle.on.rectangle.angled")
                }
            // CollectionView
            
            ProfileView()
            
            .tabItem{
                Text("Profile")
                    .font(.normalText)
                    Image(systemName: "person.fill")
                }
            // Profile
        }.accentColor(.primaryColor1)
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
