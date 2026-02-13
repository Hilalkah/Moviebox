//
//  TopMoviesRequestModel.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 13.02.2026.
//

import Foundation

struct TopMoviesRequestModel: BaseRequest {
    typealias responseModel = TopMoviesResponseModel
    
    var baseUrl: URL = MovieAPIConfig.baseURL ?? URL(fileURLWithPath: "")
    
    var path: String = "/3/movie/popular"
    
    var urlQueryItems: [URLQueryItem]? = TopMoviesRequestQuery().urlQueryItems
    
    var httpMethod: HTTPMethod? = .get
}

struct TopMoviesRequestQuery: Encodable {
    
    let apiKey: String = MovieAPIConfig.apiKey
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
    }
}
