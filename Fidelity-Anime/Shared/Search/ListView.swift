//
//  ListView.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/10/20.
//

import SwiftUI

struct ListView: View {

    var results: [AnimeRenderModel]

    var body: some View {
        List(results,  id: \.id) { renderModel in
            AnimeView(anime: renderModel)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(results: [AnimeRenderModel(id: "1"),
                           AnimeRenderModel(id: "2")])
    }
}
