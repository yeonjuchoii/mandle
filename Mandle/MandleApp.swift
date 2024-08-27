//  MandleApp.swift
//  Mandle
//  Created by 최연주 on 7/21/24.

import SwiftData
import SwiftUI

@main
struct MandleApp: App {
    private var modelContainer: ModelContainer = {
        let schema = Schema([User.self, Acne.self, Atopic.self, Bcc.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
}
