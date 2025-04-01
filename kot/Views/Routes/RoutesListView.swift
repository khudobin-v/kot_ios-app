import SwiftUI

struct RoutesListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(Strings.SearchModal.RoutesGroup.title)
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
        var attributedString = AttributedString(Strings.SearchModal.RoutesGroup.description)
        
        if let range = attributedString.range(of: Strings.SearchModal.RoutesGroup.DescriptionKeyWords.regulatedRates) {
            attributedString[range].foregroundColor = .green
        }
        
        if let range = attributedString.range(of: Strings.SearchModal.RoutesGroup.DescriptionKeyWords.KTTU_MunicipalEnterprise) {
            attributedString[range].foregroundColor = .green
        }
        
        if let range = attributedString.range(of: Strings.SearchModal.RoutesGroup.DescriptionKeyWords.others) {
            attributedString[range].foregroundColor = .green
        }
        
        return attributedString
    }
}
