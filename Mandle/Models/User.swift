//
//  User.swift
//  Mandle
//
//  Created by 정지혁 on 8/27/24.
//

import Foundation
import SwiftData

@Model
class User {
    @Attribute(.unique) var name: String
    var age: Int
    var gender: String
    var livingStressLevel: Int
    var workStressLevel: Int
    var allergies: String
    var isConsiderLivingEquator: String
    var hasFamilyHaveSkinCancer: Bool
    var skinType: String
    var sunExposeLevel: Int
    var exerciseRegularity: String
    
    init(
        name: String,
        age: Int,
        gender: String,
        livingStressLevel: Int,
        workStressLevel: Int,
        allergies: String,
        isConsiderLivingEquator: String,
        hasFamilyHaveSkinCancer: Bool,
        skinType: String,
        sunExposeLevel: Int,
        exerciseRegularity: String
    ) {
        self.name = name
        self.age = age
        self.gender = gender
        self.livingStressLevel = livingStressLevel
        self.workStressLevel = workStressLevel
        self.allergies = allergies
        self.isConsiderLivingEquator = isConsiderLivingEquator
        self.hasFamilyHaveSkinCancer = hasFamilyHaveSkinCancer
        self.skinType = skinType
        self.sunExposeLevel = sunExposeLevel
        self.exerciseRegularity = exerciseRegularity
    }
}
