//
//  HomeView.swift
//  snp65-project
//
//
//

import SwiftUI

struct HomeView: View {
    @State private var search: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var exhibitionVM = ExhibitionViewModel()
    @StateObject var upcomingVM = UpcomingViewModel()

    @State var isNavigationBarHidden: Bool = true
    @State var isSearchTapped = false

    var body: some View {
        if let user = authViewModel.currentUser {
            ScrollView {
                HStack {
                    Text("Hi \(user.username)!")
                        .font(.custom("BaiJamjuree-Semibold", size: 32))
                        .foregroundColor(.secondaryColor1)
                    Spacer()

                }.padding()
                    .padding(.bottom, -24)

                VStack(alignment: .leading) {
                    secSearchBar
                        .padding(.bottom, -16)
                    secExhbtView
                    secUpcomingHead
                        .padding(.top, -16)
                    secUpcoming
                        .padding(.top, -16)
                }
            }
        }
    } // body

    private var secExhbtView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(exhibitionVM.exhibitions, id: \.id) { post in
                        NavigationLink(destination: ExhibitionInfoView(exhibition: post)) {
                            ExhbitionInfoCard(exhibition: post)
                        }
                    }
                }.padding()
            }
        }
    } // secExhbtView

    private var secSearchBar: some View {
        HStack {
            HStack {
                TextField("\(Image(systemName: "magnifyingglass")) Search Exhibition or Location", text: $search)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color.primaryColor2, lineWidth: 1)
                    )

                    .onTapGesture {
                        isSearchTapped.toggle()
                    }
            }
            NavigationLink("", destination: SearchView(), isActive: $isSearchTapped)
        }.padding()
    } // Section Search Bar

    private var secUpcomingHead: some View {
        VStack(alignment: .leading) {
            Text("Upcoming Exhibition")
                .font(.semiTitle)
                .foregroundColor(.secondaryColor1)

        }.padding()
    } // secUpcomingHead

    private var secUpcoming: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 8) {
                    ForEach(upcomingVM.upcomings, id: \.id) { upcoming in
                        NavigationLink(destination: UpcomingInfoView(upcoming: upcoming)) {
                            UpcomingCard(upcoming: upcoming)
                        }
                    }
                }
            }
        }
    } // secUpcoming
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
