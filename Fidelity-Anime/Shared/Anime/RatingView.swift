//
//  RatingView.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/11/20.
//

import SwiftUI

struct RatingView: View {

    var rating: Rated

    var body: some View {
        Text(rating.rawValue)
            .fontWeight(.bold)
            //.font(.callout)
            .font(.system(size: 8))
            .foregroundColor(rating.color)
            .padding(.all, 5)
            .overlay(
                Capsule(style: .continuous)
                    .stroke(rating.color, style: StrokeStyle(lineWidth: 2, dash: [4]))
            )
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .pg13)
    }
}

extension Rated {
    var color: Color {
        switch self {
        case .g:
            return .red
        case .pg:
            return .green
        case .pg13:
            return .purple
        case .r:
            return .yellow
        case .ratedR:
            return .blue
        }
    }
}
