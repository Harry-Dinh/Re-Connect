//
//  ListRow.swift
//  iCTasks
//
//  Created by Harry Dinh on 2021-04-17.
//

import SwiftUI

struct ListRow: View {
    
    var taskTitle: String
    var taskNotes: String
    var dateUploaded: Date
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(taskTitle)
                    .font(.headline)
                
                Spacer()
                
                Text(dateFormatter.string(from: dateUploaded))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text(taskNotes)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(3)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(taskTitle: "Buy some milk", taskNotes: "Get milk at supermarket A.", dateUploaded: Date())
    }
}
