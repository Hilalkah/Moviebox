//
//  BaseRequest.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 13.02.2026.
//

import Foundation

protocol BaseRequest {
    associatedtype responseModel: Decodable
    var baseUrl: URL { get }
    var path: String { get }
    var urlQueryItems: [URLQueryItem]? { get }
    var httpMethod: HTTPMethod? { get }
}
