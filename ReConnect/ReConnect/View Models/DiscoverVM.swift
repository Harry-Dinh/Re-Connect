//
//  DiscoverVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-25.
//

import SwiftUI
import SwiftUIX
import Firebase

struct UserModel: Hashable {
    var firstName: String
    var middleName: String
    var lastName: String
    var email: String
}

class DiscoverVM: ObservableObject {
    static let shared = DiscoverVM()
    
    private var databaseRef = Database.database().reference()
    
    private var users = [[String: String]]()
    private var results = [[String: String]]()
    var hasFetched = false
    
    @Published var searchField: String = ""
    @Published var isTextFieldEditing: Bool = false
    @Published var noResultsLabelHidden: Bool = false
    
    public func searchFieldReturnButtonTapped(_ query: String) {
        guard !query.isEmpty, !query.replacingOccurrences(of: " ", with: "").isEmpty else {
            return
        }
        
        results.removeAll()
        self.searchUsers(query: query)
    }
    
    public func searchUsers(query: String) {
        // Check if array has Firebase results
        // If it does, filter
        // If not, fetch then filter
        // Update the UI: either show results or no results label
        
        if hasFetched {
            filterUsers(with: query)
        }
        else {
            RegisterVM.shared.getAllUsers { [weak self] result in
                switch result {
                case .success(let usersCollection):
                    self?.users = usersCollection
                    self?.filterUsers(with: query)
                case .failure(let error):
                    print("Failed to get users: \(error)")
                }
            }
        }
    }
    
    func filterUsers(with term: String) {
        guard hasFetched else {
            return
        }
        
        let results: [[String: String]] = self.users.filter {
            guard let name = $0["name"]?.lowercased() else {
                return false
            }
            
            return name.hasPrefix(term.lowercased())
        }
        
        self.results = results
        
        updateUI()
    }
    
    func updateUI() {
        if results.isEmpty {
            self.noResultsLabelHidden = false
        }
        else {
            self.noResultsLabelHidden = true
            let tableView = UITableView()
            tableView.reloadData()
        }
    }
}

/// A table view cell for the Discover tab
struct DiscoverListRow: View {
    
    var fullName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(fullName)
            }
        }
    }
}
