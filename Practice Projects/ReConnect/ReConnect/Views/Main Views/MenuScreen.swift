//
//  MenuScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct MenuScreen: View {

    // MARK: - View Models

    @ObservedObject var viewModel = MenuScreenVM.instance
    @ObservedObject var loginVM = LoginScreenVM.instance

    // MARK: - Local Constants

    private let menuScreenTitle = "Menu"
    private let userContentHeader = "My Contents"
    private let userCollectionsHeader = "My Collections"
    private let userCollectionsEmptyPlaceholder = "You haven't created any collections."
    private let appSectionHeaderText = "Application"
    private let groupRowItem = RECListRowItem(
        label: "Groups",
        iconStr: "\(CUPSystemIcon.person).2",
        tintColor: .accentColor
    )
    private let socialRowItem = RECListRowItem(
        label: "Social Awards",
        iconStr: CUPSystemIcon.medalIcon,
        tintColor: .cyan
    )
    private let donationsRowItem = RECListRowItem(
        label: "Followers Donations",
        iconStr: CUPSystemIcon.sparkleIcon,
        tintColor: .purple
    )
    private let supportAndFeedbackRow = RECListRowItem(
        label: "Support & Feedback",
        iconStr: CUPSystemIcon.feedbackAndSupport,
        tintColor: .secondary
    )
    private let aboutAppRow = RECListRowItem(
        label: "About Re:Connect",
        iconStr: CUPSystemIcon.infoCircle,
        tintColor: .secondary
    )

    // MARK: - View Components

    var body: some View {
        NavigationView {
            List {
                profileHeaderSection
                userContentSection
                userCollectionsSection
                appMenuSection
            }
            .headerProminence(.increased)
            .navigationTitle(menuScreenTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.newCollection)
                    }
                }
            }
        }
    }

    var profileHeaderSection: some View {
        ProfileListRowView(user: loginVM.currentUser ?? RECUser.placeholderUser)
    }

    var userContentSection: some View {
        Section(userContentHeader) {
            RECMenuListRow(rowItem: groupRowItem)
            RECMenuListRow(rowItem: socialRowItem)
            RECMenuListRow(rowItem: donationsRowItem)
        }
    }

    var userCollectionsSection: some View {
        Section(userCollectionsHeader) {
            HStack {
                Spacer()
                Text(userCollectionsEmptyPlaceholder)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
    }

    var appMenuSection: some View {
        Section(appSectionHeaderText) {
            NavigationLink(
                destination: AppSettingsScreen.init,
                label: {
                    RECMenuListRow(rowItem: viewModel.applicationSectionItems[0])
                }
            )

            RECMenuListRow(rowItem: supportAndFeedbackRow)

            NavigationLink(
                destination: AboutThisAppView.init,
                label: {
                    RECMenuListRow(rowItem: aboutAppRow)
                }
            )
        }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
