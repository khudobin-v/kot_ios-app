import SwiftUI

struct GroupContainer<Content: View>: View {
    @State var heading: String
    @State var canNavigate: Bool?
    @State var action: (() -> Void)?
    let content: Content
    
    init(heading: String, canNavigate: Bool? = nil, action: (() -> Void)? = nil, @ViewBuilder content: () -> Content) {
        self._heading = State(initialValue: heading)
        self._canNavigate = State(initialValue: canNavigate)
        self._action = State(initialValue: action)
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center) {
                Text(heading)
                    .font(.callout)
                    .fontWeight(.semibold)
                Spacer()
                if canNavigate == true, let action = action {
                    Button(action: action) {
                        Image(systemName: "chevron.right")
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
