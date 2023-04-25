//
//  ContentView.swift
//  TodoWatch Watch App
//
//  Created by Thays Prado on 21/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: WatchViewModel = WatchViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(viewModel.taskList.enumerated()), id: \.element) { index, task in
                    Button(action: {
                        self.updateTask(index, task.status)
                    }, label: {
                        HStack {
                            Image(systemName: self.getIcon(task.status))
                            Text(task.text)
                        }
                    })
                }
            }
        }
        .padding()
    }
    
    func updateTask(_ index: Int, _ status: Bool) {
        viewModel.updateTask(index: index, status: !status)
    }
    
    func getIcon(_ status: Bool) -> String {
        if status {
            return "checkmark.circle.fill"
        }

        return "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
