//
//  Bcc.swift
//  Mandle
//
//  Created by 정지혁 on 8/27/24.
//

import Foundation
import SwiftData

@Model
class Bcc {
    @Attribute(.unique) var id: UUID
    var timestamp: Date
    var imageName: String
    var symptom: String
    
    init(timestamp: Date, imageName: String, symptom: String) {
        self.id = UUID()
        self.timestamp = timestamp
        self.imageName = imageName
        self.symptom = symptom
    }
}
