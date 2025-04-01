import SwiftUI

struct RoutesListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Маршруты")
                .font(.title.weight(.medium))
            
            ScrollView {
                Text(attributedDescription)
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var attributedDescription: AttributedString {
        var attributedString = AttributedString("Список маршрутов общественного транспорта разделен на три категории: регулируемый тариф, маршруты МУП КТТУ и остальные. На данный момент доступно 126 маршрутов.")
        
        if let range = attributedString.range(of: "регулируемый тариф") {
            attributedString[range].foregroundColor = .green
        }
        
        if let range = attributedString.range(of: "МУП КТТУ") {
            attributedString[range].foregroundColor = .green
        }
        
        if let range = attributedString.range(of: "остальные") {
            attributedString[range].foregroundColor = .green
        }
        
        return attributedString
    }
}
