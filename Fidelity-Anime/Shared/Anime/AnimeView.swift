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
                    Text(anime.title)
                }
                Text(anime.title)
            }

            Text(anime.rating)
                .fontWeight(.bold)
                //.font(.callout)
                .font(.system(size: 8))
                .foregroundColor(.purple)
                .padding(.all, 5)
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(Color.purple, style: StrokeStyle(lineWidth: 2, dash: [4]))
                )
        }
    }
}

struct AnimeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeView(anime: AnimeRenderModel(id: "1"))
    }
}
