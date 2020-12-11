//
//  SearchViewModel.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/9/20.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {

    var renderModel: [AnimeRenderModel] = []
    @Published var searchString = ""
    @Published var viewState: SearchViewState = .initialSearch

    var anyCancellable = Set<AnyCancellable>()

    var api: NetworkServicable

    init(api: NetworkServicable) {
        self.api = api
        $searchString
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .filter { !$0.isEmpty && $0.first != " " }
            .sink { result in
                self.getSearchResults(for: result)
        }.store(in: &anyCancellable)

    }

}

extension SearchViewModel {

    private func getSearchResults(for searchText: String) {

        api.search(searchText)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure:
                    self.viewState = .error
                case .finished:
                    break
                }
            }) { [self] result in

                if result.results.count == 0 {
                    self.viewState = .noResults(searchText)
                }
                else {
                    self.renderModel = result.results.map { AnimeRenderModel(anime: $0) }
                    self.viewState = .success
                }
            }
            .store(in: &anyCancellable)
    }
}

enum SomeError: Error {
    case incorrectOuput
}



