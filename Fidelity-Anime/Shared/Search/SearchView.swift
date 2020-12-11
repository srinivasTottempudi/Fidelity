//
//  SearchView.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/9/20.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                ZStack {
                    Color.black.opacity(0.3)
                    HStack {
                        TextField("Search", text: $viewModel.searchString)
                            .padding([.leading, .trailing], 6)
                            .frame(height: 30)
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(15)
                    }
                    .padding([.leading, .trailing], 14)
                }.frame(height: 60)

                Spacer()

                switch viewModel.viewState {
                case .error:
                    VStack {
                        Spacer()
                        Text("Error fetching data")
                            .fontWeight(.bold)
                            .font(.callout)
                        Spacer()
                    }
                case let .noResults(searchText):
                    VStack {
                        Spacer()
                        Text("No Results for \(searchText)")
                            .fontWeight(.bold)
                            .font(.callout)
                        Spacer()
                    }
                case .initialSearch:
                    VStack {
                        Spacer()
                        Text("Please search for Anime's")
                            .fontWeight(.bold)
                            .font(.callout)
                        Spacer()
                    }
                case .success:
                    ListView(results: viewModel.renderModel)
                }

            }.navigationBarTitle(Text("Search"))
        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView(viewModel: SearchViewModel(api: NetorkService()))
            SearchView(viewModel: SearchViewModel(api: NetorkService()))
                .preferredColorScheme(.dark)
        }
    }
}
