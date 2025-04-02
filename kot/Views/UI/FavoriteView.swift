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
                    .foregroundColor(.blue)
                    .frame(width: 60, height: 60)
                    .background(.gray.opacity(0.1))
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
