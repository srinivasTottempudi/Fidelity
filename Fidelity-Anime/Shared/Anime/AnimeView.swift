//
//  AnimeView.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/10/20.
//

import SwiftUI

struct AnimeView: View {

    var anime: AnimeRenderModel

    var body: some View {
        HStack {
            AsyncImage(
                url: anime.imageURL,
                placeholder: { Text("Loading ...") },
                image: { Image(uiImage: $0).resizable() }
            )
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)

            VStack {
                Text(anime.title)
                if anime.isAiring {
                    Text("Airing Now")
                }
                Text(anime.title)
            }
        }
    }
}

struct AnimeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeView(anime: AnimeRenderModel(id: "1"))
    }
}
