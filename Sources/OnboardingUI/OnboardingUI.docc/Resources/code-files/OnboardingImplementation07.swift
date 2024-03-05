import SwiftUI
import OnboardingUI

struct SomeView: View {
    @Environment(\.appVersionManager) private var appVersionManager
    
    var body: some View {
        SomeDetailView()
    }
}
