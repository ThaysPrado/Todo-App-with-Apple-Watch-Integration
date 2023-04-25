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
                ForEach($viewModel.taskList.wrappedValue, id: \.self) { task in
                    Button(action: teste) {
                        HStack {
                            Image(systemName: self.getIcon(task.status))
                            Text(task.text)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    func teste() { }
    
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
