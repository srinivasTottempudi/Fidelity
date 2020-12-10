//
//  NetworkService.swift
//  Fidelity-Anime
//
//  Created by Tottempudi Sri on 12/9/20.
//

import Foundation
import Combine


protocol NetworkServicable {
    func search(_ searchString: String) -> AnyPublisher<Result, Error>
}


class NetorkService: NetworkServicable {

    struct Response<T> {
        let value: T
        let response: URLResponse
    }

    let baseUrl = URL(string: "https://api.jikan.moe/v3/search/anime")

    public func get<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func search(_ searchString: String) -> AnyPublisher<Result, Error> {

        guard let baseURL = baseUrl,
              var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            fatalError("Couldn't create URLComponents")
        }

        components.queryItems = [URLQueryItem(name: "q", value: searchString)] // 4

        let request = URLRequest(url: components.url!)

        return get(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
