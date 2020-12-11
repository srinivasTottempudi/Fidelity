//
//  SearchViewState.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/11/20.
//

import Foundation

/// View State that defines the Search view current state.
enum SearchViewState {
    case initialSearch
    case noResults(String)
    case success
    case error
}
