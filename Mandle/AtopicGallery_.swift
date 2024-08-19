//  AtopicGallery_.swift
//  Mandle

import SwiftUI

struct AtopicGallery_: View {
    var body: some View {
        NavigationStack{
            GeometryReader{
                metrics in
                
                VStack{
                    HStack{
                        Button(action: {}, label: {Image("BackArrow")})
                        Text("Gallery")
                        Button(action: {}, label: {Image("ShareIcon")})
                    }
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
                            .frame(height: metrics.size.height * 0.35)
                            .accentColor(Color(hex: "EFE9E0"))
                        
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: metrics.size.height * 0.35)
                            .accentColor(Color(hex: "EFE9E0"))
                    }
                    HStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: metrics.size.height * 0.35)
                            .accentColor(Color(hex: "EFE9E0"))
                        
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: metrics.size.height * 0.35)
                            .accentColor(Color(hex: "EFE9E0"))
                    }
                    HStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: metrics.size.height * 0.35)
                            .accentColor(Color(hex: "EFE9E0"))
                        
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: metrics.size.height * 0.35)
                            .accentColor(Color(hex: "EFE9E0"))
                    }
                }
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 25)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex : "CCC5AC"))
    }
}

#Preview {
    AtopicGallery_()
}
