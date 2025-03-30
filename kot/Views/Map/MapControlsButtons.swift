import SwiftUI

struct MapControlsButtons: View {
    @Binding var mapRotation: Double
    let viewModel: LocationViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Button(action: {}) {
                        Image(systemName: "square.3.layers.3d.top.filled")
                            
                    }
                    .circleButtonStyle()
                    Spacer()
                }
                .padding(.horizontal, 5)
                Spacer()
                VStack {
                    Button(action: {
                        viewModel.toggleTracking()
                    }) {
                        Image(systemName: viewModel.buttonIcon)
                            
                    }
                    .circleButtonStyle()
                    .padding(.horizontal, 5)
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        StarButton()
                        Button(action: {
                            viewModel.zoomIn()
                        }) {
                            Image(systemName: "plus")
                        }
                        .circleButtonStyle()
                        
                        Button(action: {
                            viewModel.zoomOut()
                        }) {
                            Image(systemName: "minus")
                        }
                        .circleButtonStyle()
                        ResetRotationButton(mapRotation: mapRotation) {
                            viewModel.resetRotation()
                            mapRotation = 0
                        }
                    }
                    .padding(.horizontal, 5)
                    Spacer()
                }
            }
            
        }
    }
}
