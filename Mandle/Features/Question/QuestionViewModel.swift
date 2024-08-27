//
//  QuestionViewModel.swift
//  Mandle
//
//  Created by 정지혁 on 8/27/24.
//

import Foundation

@Observable
class QuestionViewModel {
    var user: User
    var step: Int
    
    init(user: User, step: Int) {
        self.user = user
        self.step = step
    }
    
    func stepUp() {
        step += 1
    }
    
    func stepDown() {
        step -= 1
    }
    
    func saveAge(_ age: Int) {
        user.age = age
    }
    
    func saveGender(_ gender: Gender) {
        user.gender = gender.label
    }
    
    func saveLivingStressLevel(_ level: Int) {
        user.livingStressLevel = level
    }
    
    func saveWorkStressLevel(_ level: Int) {
        user.workStressLevel = level
    }
    
    func saveAllergies(_ allergies: String) {
        user.allergies = allergies
    }
    
    func saveIsConsiderLivingEquator(_ answer: String) {
        user.isConsiderLivingEquator = answer
    }
    
    func saveHasFamilyHaveSkinCancer(_ answer: Bool) {
        user.hasFamilyHaveSkinCancer = answer
    }
    
    func saveSkinType(_ type: SkinType) {
        user.skinType = type.label
    }
    
    func saveSunExposeLevel(_ level: Int) {
        user.sunExposeLevel = level
    }
    
    func saveExercise(_ frequency: Frequency) {
        user.exerciseRegularity = frequency.label
    }
}
