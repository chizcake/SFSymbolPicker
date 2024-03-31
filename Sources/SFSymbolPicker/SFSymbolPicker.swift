import OSLog
import SwiftUI

public struct SFSymbolPicker: View {
    @Binding var selectedSymbol: String?
    
    @Environment(\.dismiss) private var dismiss
    @State private var searchTerm = ""
    
    private let viewModel = SFSymbolPickerViewModel()
    private var symbols: [String] {
        viewModel.filteredSymbols(for: searchTerm)
    }
    
    public init(selectedSymbol: Binding<String?>) {
        _selectedSymbol = selectedSymbol
    }
    
    public var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))], spacing: 20) {
                    ForEach(symbols, id: \.self) { symbol in
                        Logger.picker.debug("Symbol: \(symbol)")
                        
                        return Button(action: {
                            withAnimation {
                                selectedSymbol = symbol
                            }
                        }, label: {
                            SFSymbolIcon(symbol: symbol, isSelected: symbol == selectedSymbol)
                        })
                    }
                }
            }
            .safeAreaPadding(.top)
            .searchable(text: $searchTerm, prompt: "Search Symbol")
            .navigationTitle("Select Symbol")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
            }
        }
        .onChange(of: selectedSymbol) {
            dismiss()
        }
    }
}

#Preview {
    SFSymbolPicker(selectedSymbol: .constant("square.and.arrow.up.badge.clock"))
}
