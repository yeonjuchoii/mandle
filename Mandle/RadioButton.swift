//  RadioButton.swift
//  Mandle
//  Created by 최연주 on 8/7/24.
import SwiftUI

struct RadioButton: View {
    @Binding var isOn: Bool
    let label : String
    
    var body: some View {
        Button(action: {
            isOn.toggle()
        }){
            HStack{
                Circle()
                    .strokeBorder(isOn ? Color.blue : Color.gray, lineWidth: 2)
                    .background(Circle().fill(isOn ? Color.blue : Color.clear))
                    .frame(width: 20, height: 20)
                
                Text(label)
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    
}
