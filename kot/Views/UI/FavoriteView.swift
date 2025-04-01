import SwiftUI

struct FavoriteView<ChildrenView: View>: View {
    @State var name: String
    @State var iconName: String
    @State var sheetIsPresented: Bool = false
    let childrenView: ChildrenView
    var body: some View {
        Button(action: {
            sheetIsPresented = true
        }) {
            VStack(spacing: 10) {
                Image(systemName: iconName)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                    .foregroundColor(.darkGreen)
                    .frame(width: 60, height: 60)
                    .background(Color(.green).opacity(0.3))
                    .clipShape(Circle())
                Text(name)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
            }
        }
        .sheet(isPresented: $sheetIsPresented) {
            VStack {
                childrenView.padding().padding(.top, 10)
                Spacer()
            }
            .presentationDragIndicator(.visible)
        }
    }
}
