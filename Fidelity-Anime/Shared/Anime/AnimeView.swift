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
            .frame(width: 100, height: 150)

            VStack(alignment: .leading) {

                Text(anime.title)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                HStack {
                    HStack {
                        if let score = anime.score {
                            Text("Score:")
                                .foregroundColor(.gray)
                            Text(String(format:"%.2f", score)).foregroundColor(.blue)
                        }

                    }
                }

            }
            Spacer()
            VStack(alignment: .center) {
                if anime.isAiring {
                    Text("Airing")
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .padding(.all, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 4)
                        )
                }
                if let rating = anime.rating {
                    RatingView(rating: rating)

                }
            }
        }.padding(.trailing, 10)
    }
}

struct AnimeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeView(anime: AnimeRenderModel(id: "1"))
    }
}
