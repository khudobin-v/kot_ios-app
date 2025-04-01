import SwiftUI

struct RoutesGroupView<ChildrenView: View>: View {
    @State var sheetIsPresented: Bool = false
    let childrenView: ChildrenView
    struct Route: Identifiable {
        let id = UUID()
        let transportType: TransportType
        let routeNumber: String
    }
    
    let routes: [Route] = [
        Route(transportType: .tram, routeNumber: "8"),
        Route(transportType: .trolleybus, routeNumber: "21"),
        Route(transportType: .bus, routeNumber: "2Е")
    ]
    var body: some View {
        GroupContainer(heading: "Маршруты", canNavigate: true, action: {sheetIsPresented = true}) {
            HStack {
                ForEach(routes) { route in
                    RouteButton(transportType: route.transportType, routeNumber: route.routeNumber)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .onTapGesture {
            sheetIsPresented = true
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
