//
//  SearchView.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/9/20.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var viewModel: SearchViewModel

    @Binding var text: String

    

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Color.black.opacity(0.3)
                    HStack {
                        TextField("Search", text: $text)
                            .padding([.leading, .trailing], 6)
                            .frame(height: 30)
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(15)
                    }
                    .padding([.leading, .trailing], 14)
                }.frame(height: 60)


                switch viewModel.viewState {
                case .error:
                    Text("Error")
                case .noResults:
                    Text("No Results")
                case .anime:
                    ListView(results: viewModel.renderModel)
                }
            }.navigationBarTitle(Text("Search"))
        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView(viewModel: SearchViewModel(api: NetorkService()), text: .constant(""))
            SearchView(viewModel: SearchViewModel(api: NetorkService()), text: .constant(""))
                .preferredColorScheme(.dark)
        }
    }
}

enum SearchViewState {
    case error
    case noResults(String)
    case anime([AnimeRenderModel])
}


