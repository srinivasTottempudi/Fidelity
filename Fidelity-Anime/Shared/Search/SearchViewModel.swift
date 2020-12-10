//
//  SearchViewModel.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/9/20.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {

    @Published var animeMovies: [Anime]?
    var renderModel: [AnimeRenderModel] = []
    @Published var searchString = ""

    @Published var viewState: SearchViewState = .noResults("Initial Search")

    var cancellationToken = Set<AnyCancellable>()

    var api: NetworkServicable

    init(api: NetworkServicable) {
        self.api = api
    }

}

extension SearchViewModel {

    func getSearchResults(for searchText: String) {
        api.search(searchText)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure:
                    self.viewState = .error
                case .finished:
                    self.viewState = .anime([])
                }
            }) { [self] result in

                if result.results.count == 0 {
                    self.viewState = .noResults("No Search results")
                }
                else {
                    self.renderModel = self.mapToRenderModel(animes: result.results)
                    self.viewState = .anime(self.mapToRenderModel(animes: result.results))
                }
            }
            .store(in: &cancellationToken)
    }

    func mapToRenderModel(animes: [Anime]) -> [AnimeRenderModel] {
        animes.map { AnimeRenderModel(anime: $0) }
    }

}

enum SomeError: Error {
    case incorrectOuput
}



