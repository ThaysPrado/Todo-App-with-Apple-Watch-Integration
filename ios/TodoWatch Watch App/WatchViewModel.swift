//
//  WatchViewModel.swift
//  TodoWatch Watch App
//
//  Created by Thays Prado on 21/04/23.
//

import Foundation
import WatchConnectivity

class WatchViewModel: NSObject, ObservableObject {
    var session: WCSession
    @Published var taskList = [Task]()
    
    // Add more cases if you have more receive method
    enum WatchReceiveMethod: String {
        case sendDataToNative
    }
    
    // Add more cases if you have more sending method
    enum WatchSendMethod: String {
        case sendMsgToFlutter
    }
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    func sendDataMessage(for method: WatchSendMethod, data: [String: Any] = [:]) {
        sendMessage(for: method.rawValue, data: data)
    }
    
    private func makeTaskList(_ origin: [Any]) -> [Task] {
        var tasks = [Task]()
        for item in origin {
            if let task = item as? [Any], task.count > 1, let text = task[0] as? String, let status = task[1] as? Bool {
                tasks.append(Task(text: text, status: status))
            }
        }
        return tasks
    }
    
}

extension WatchViewModel: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    // Receive message From AppDelegate.swift that send from iOS devices
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            guard let method = message["method"] as? String, let enumMethod = WatchReceiveMethod(rawValue: method) else {
                return
            }
            
            switch enumMethod {
            case .sendDataToNative:
                self.taskList = self.makeTaskList(message["data"] as? [Any] ?? [Any]())
            }
        }
    }
    
    func sendMessage(for method: String, data: [String: Any] = [:]) {
        guard session.isReachable else {
            return
        }
        let messageData: [String: Any] = ["method": method, "data": data]
        session.sendMessage(messageData, replyHandler: nil, errorHandler: nil)
    }
    
}
