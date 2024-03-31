import SwiftUI

struct SFSymbolIcon: View {
    let symbol: String
    let isSelected: Bool
    
    var body: some View {
        Image(systemName: symbol)
            .font(.title)
            .foregroundStyle(isSelected ? Color.white : .primary)
            .frame(width: 50, height: 50)
            .background(
                isSelected ? Color.primary.opacity(0.5) : Color.clear,
                in: RoundedRectangle(cornerRadius: 10)
            )
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(isSelected ? Color.primary : Color.clear, lineWidth: 1)
//            )
//            .shadow(color: isSelected ? Color.primary : Color.clear, radius: 2, x: 0, y: 0)
            .scaleEffect(isSelected ? 1.1 : 1.0)
    }
}

#Preview {
    SFSymbolIcon(symbol: "star", isSelected: true)
}

#Preview {
    SFSymbolIcon(symbol: "star", isSelected: true)
        .preferredColorScheme(.dark)
}
