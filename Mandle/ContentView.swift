import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    var body: some View {
        if isLoading{
            SplashView()
                .task{
                    try? await Task.sleep(for: .seconds(2))
                    isLoading = false
            }
        }
        else{
            QuestionView()
            
        }
    }
}

#Preview {
    ContentView()
}
