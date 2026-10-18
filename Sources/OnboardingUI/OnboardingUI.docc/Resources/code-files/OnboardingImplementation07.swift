import OnboardingUI
import SwiftUI

struct SomeView: View {
    @Environment(\.appVersionManager) private var appVersionManager

    var body: some View {
        SomeDetailView()
    }
}
