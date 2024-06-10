//
//  ForgotView.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import SwiftUI

struct ForgotView: View {
    @Bindable private var viewModel: ForgotViewModel
    @Environment(\.dismiss) private var dissmis
    private let constants = Constants.shared
    
    init(_ viewModel: ForgotViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .foregroundStyle(.blue)
            Text("Hello, world!")
                .foregroundStyle(.blue)
        }
        .onAppear {
            AnalyticsService.specialScreenView("Forgot Password")
        }
    }
}

#Preview {
    ForgotView( ForgotViewModel( LandingViewModel( LandingCoordinator( AppCoordinator() ) ) ) )
}
