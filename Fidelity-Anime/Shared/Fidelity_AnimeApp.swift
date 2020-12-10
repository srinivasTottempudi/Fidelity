//
//  Fidelity_AnimeApp.swift
//  Shared
//
//  Created by Tottempudi Sri on 12/9/20.
//

import SwiftUI

@main
struct Fidelity_AnimeApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel(api: NetorkService()),
                       text: .constant(""))
        }
    }
}
