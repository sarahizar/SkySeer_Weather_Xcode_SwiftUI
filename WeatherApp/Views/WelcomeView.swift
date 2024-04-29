

import SwiftUI

#if canImport(CoreLocationUI)
import CoreLocationUI
#endif

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                Text("Welcome to SkySeer")
                    .bold().font(.title)
                
                Text("Please share your current location to receive the weather in your area")
                    .padding()
            }
            
            multilineTextAlignment(.center)
                .padding()
            
            #if canImport(CoreLocationUI)
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            #endif
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#if DEBUG
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
#endif
    
