import Foundation

final class SFSymbolPickerViewModel {
    private var allSymbols: [String] = []
    
    init() {
        loadSymbols()
    }
    
    func filteredSymbols(for searchTerm: String) -> [String] {
        guard !searchTerm.isEmpty else {
            return allSymbols
        }
        
        return allSymbols.filter { $0.localizedCaseInsensitiveContains(searchTerm) }
    }
}

extension SFSymbolPickerViewModel {
    private func loadSymbols() {
        guard let url = Bundle.module.url(forResource: "Symbols", withExtension: "txt") else {
            assertionFailure("`Symbols.txt` file not found.")
            return
        }
        
        do {
            let content = try String(contentsOf: url)
            allSymbols = content
                .split(separator: "\n")
                .map(String.init)
                .filter { !$0.hasPrefix("//") } // Remove comments
        }
        catch {
            assertionFailure("Error reading `Symbols.txt` file.")
        }
    }
}
