import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            let randomLatitude = (Double(arc4random_uniform(500) - 250 ) ) / 1000.0
        }
    }
}
