//  AtopicGallery_.swift
//  Mandle

import SwiftUI

struct AtopicView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack{
                Text("ATOPIC DERMATITIS")
                    .font(.system(size: 27))
                Spacer()
                Button(action: {}, label: {Text("show details")})
            }
            
            HStack{
                Button(action: {}, label: {Image("RecentIcon")})
                Text("Recents")
                Spacer()
                Button(action: {}, label: {Image("GridIcon")})
            }
            
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .accentColor(Color(hex: "EFE9E0"))
                
                RoundedRectangle(cornerRadius: 25)
                    .accentColor(Color(hex: "EFE9E0"))
            }
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .accentColor(Color(hex: "EFE9E0"))
                
                RoundedRectangle(cornerRadius: 25)
                    .accentColor(Color(hex: "EFE9E0"))
            }
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .accentColor(Color(hex: "EFE9E0"))
                
                RoundedRectangle(cornerRadius: 25)
                    .accentColor(Color(hex: "EFE9E0"))
            }
        }
        .padding(.horizontal, 24)
        .background(Color.background.ignoresSafeArea())
        .navigationTitle("Gallery")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("BackArrow")
                }
            }
        }
    }
}

#Preview {
    AtopicView()
}
