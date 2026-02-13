//
//  Optional+Helpers.swift
//  Moviebox
//
//  Created by Hilal Kahraman on 13.02.2026.
//

import Foundation

extension Optional {
    
    struct FoundNilWhileUnwrappingError: Error { }
    
    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilWhileUnwrappingError()
        }
    }
}
