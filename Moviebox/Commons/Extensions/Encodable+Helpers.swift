//
//  Encodable+Helpers.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 13.02.2026.
//

import Foundation

extension Encodable {
    
    var urlQueryItems: [URLQueryItem] {
        guard let data = try? JSONEncoder().encode(self),
              let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return []
        }
        return dict.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
}
