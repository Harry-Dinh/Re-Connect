//
//  AboutThisAppView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-05-10.
//

import SwiftUI

struct AboutThisAppView: View {

    // MARK: - Local Constants

    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "INVALID_VERSION"
    }

    private var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "INVALID_BUILD_NUM"
    }

    private let currentYear: String = {
        let currentDate = Date.now
        let currentYear = Calendar.current.component(.year, from: currentDate)
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = false
        numberFormatter.numberStyle = .decimal
        let yearStr = numberFormatter.string(from: NSNumber(value: currentYear)) ?? "INVALID_CURRENT_YEAR"
        return yearStr
    }()

    // MARK: - View Components

    var body: some View {
        Form {
            viewHeader
                .listRowBackground(Color.clear)
            technicalInfoSection
            linksSection
            copyrightSection
                .listRowBackground(Color.clear)
        }
        .navigationTitle("About Re:Connect")
        .navigationBarTitleDisplayMode(.inline)
    }

    var appIconHeader: some View {
        ZStack {
            Image(systemName: "app.fill")
                .foregroundStyle(Color.accentColor)
                .font(.system(size: 90))

            if buildNumber.last == "B" {
                Text("BETA")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .padding(.vertical, 1)
                    .padding(.horizontal, 7)
                    .background {
                        Capsule()
                            .foregroundStyle(.gray.gradient)
                    }
                    .offset(x: 30, y: 35)
            }
        }
    }

    var viewHeader: some View {
        HStack(spacing: 15) {
            appIconHeader

            VStack(alignment: .leading) {
                Text("Re:Connect")
                    .font(.title)
                    .fontWeight(.bold)
                Text("By Harry Dinh")
                    .foregroundStyle(.secondary)
            }
        }
    }

    var technicalInfoSection: some View {
        Section {
            HStack {
                Text("Version:")
                Spacer()
                Text(appVersion)
                    .foregroundStyle(.secondary)
                    .fontDesign(.monospaced)
            }

            HStack {
                Text("Build:")
                Spacer()
                Text(buildNumber)
                    .foregroundStyle(.secondary)
                    .fontDesign(.monospaced)
            }
        }
    }

    var linksSection: some View {
        Section {
            Button("Terms and Conditions") {}
            Button("GitHub Page") {}
        }
    }

    var copyrightSection: some View {
        Section {
            HStack {
                Spacer()
                Text("This computer software, source code, and the Re:Connect name are the properties of Harry Dinh. Copyright © 2023 - \(currentYear)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack {
        AboutThisAppView()
    }
}
