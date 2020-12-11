//
//  AnimeDetailView.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/10/20.
//

import SwiftUI


struct AnimeDetailView : View {

    var anime: AnimeRenderModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                ZStack(alignment: .bottom) {
                    AsyncImage(
                        url: anime.imageURL,
                        placeholder: { Text("Loading ...") },
                        image: { Image(uiImage: $0).resizable() }
                    )
                    .aspectRatio(contentMode: .fit)
                    Rectangle()
                        .frame(height: 80)
                        .opacity(0.25)
                        .blur(radius: 10)
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(anime.title)
                                .foregroundColor(.white)
                                .bold()
                                .font(.largeTitle)
                        }
                        .padding(.leading)
                        .padding(.bottom)
                        Spacer()
                        if let rating = anime.rating {
                            RatingView(rating: rating)
                                .padding(.leading, 10)
                        }
                    }
                }
                VStack(alignment: .center,spacing: 15) {
                    Text(anime.synopsis)
                        .foregroundColor(.primary)
                        .font(.body)
                        .lineSpacing(14)
                }.padding(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .topLeading)
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        }
    }
}

struct AnimeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeDetailView(anime: AnimeRenderModel(id: "1"))
    }
}
