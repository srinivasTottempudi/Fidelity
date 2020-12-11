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
            .frame(width: 100, height: 100)

            VStack {

                Text(anime.title)
                if anime.isAiring {
                    Text(anime.title)
                }
                Text(anime.title)
            }
            if let rating = anime.rating {
                RatingView(rating: rating)
            }
        }
    }
}

struct AnimeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeView(anime: AnimeRenderModel(id: "1"))
    }
}
