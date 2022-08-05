//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Kyle Morton on 8/4/22.
//

import Foundation

struct ErrorWrapper : Identifiable {
    let id: UUID;
    let error: Error;
    let guidance: String;
    
    internal init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
    
}
