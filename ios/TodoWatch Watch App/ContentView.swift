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
            Button(action: teste) {
                HStack {
                    Image(systemName: self.getIcon())
                    Text(self.getTask())
                }
            }
        }
        .padding()
    }
    
    func teste() { }
    
    func getIcon() -> String {
        if viewModel.status {
            return "checkmark.circle.fill"
        }
        
        return "circle"
    }
    
    func getTask() -> String {
        return viewModel.taskText
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
