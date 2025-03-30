import SwiftUI

struct GroupContainer<Content: View>: View {
    @State var heading: String
    @State var canNavigate: Bool?
    let content: Content
    
    init(heading: String, canNavigate: Bool? = nil, @ViewBuilder content: () -> Content) {
        self._heading = State(initialValue: heading)
        self._canNavigate = State(initialValue: canNavigate)
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center) {
                Text(heading)
                    .font(.callout)
                    .fontWeight(.semibold)
                Spacer()
                if canNavigate != nil {
                    Button(action: {}) {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.primary)
                            .opacity(0.7)
                    }
                }
            }

            content
        }
        .padding(15)
        .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial))
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
    
}
