import SwiftData
import SwiftUI

struct ContentView: View {
    @Query private var users: [User]
    
    @State private var isLoading = true
    
    private var user: User? { users.first }
    
    var body: some View {
        if isLoading {
            SplashView()
                .task {
                    try? await Task.sleep(for: .seconds(2))
                    isLoading = false
                }
        } else if user != nil {
            HomeView()
        } else {
            QuestionView()
        }
    }
}

#Preview {
    ContentView()
}
