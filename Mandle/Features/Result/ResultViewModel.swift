//
//  ResultViewModel.swift
//  Mandle
//
//  Created by 정지혁 on 8/28/24.
//

import SwiftUI

@Observable
class ResultViewModel {
    let output : [String: Double]
    let image: UIImage
    
    var symptom = ""
    
    var mainCategory: String {
        output.max(by: {$0.value < $1.value})?.key ?? "Acne"
    }
    
    init(output: [String : Double], image: UIImage) {
        self.output = output
        self.image = image
    }
}
