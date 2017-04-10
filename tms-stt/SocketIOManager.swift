//
//  SocketIOManager.swift
//  tms-stt
//
//  Created by Daniel Elsner on 09.04.17.
//  Copyright © 2017 Elsner & Mense GbR. All rights reserved.
//

import SocketIO

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    var socket = SocketIOClient(socketURL: URL(string: "http://192.168.0.111:4000")!, config: [.log(false), .forcePolling(true)])

    override init() {
        super.init()

    }

    func establishConnection(completionHandler: @escaping () -> Void) {
        addListeners(completionHandler: completionHandler)
        socket.connect()
    }

    func addListeners(completionHandler: @escaping () -> Void) {
        socket.on("\(MeetingManager.sharedInstance.currentMeetingId)") { dataArray, ack in
            let json = dataArray[0] as? [String: Any]
            let recording = json?["recording"] as! Bool?
            let recordingUser = json?["user"] as! String?
            let recordingTag = json?["tagType"] as! String?
            print(json)
            if recording != nil {
                if recordingUser != nil {
                    MeetingManager.sharedInstance.recording = recording! && recordingUser! == MeetingManager.sharedInstance.userId
                    MeetingManager.sharedInstance.recordingTag = recordingTag!
                } else {
                    MeetingManager.sharedInstance.recording = false
                }
                print("recording \(recording!)")
                completionHandler()
            }
        }

        socket.on("\(MeetingManager.sharedInstance.currentMeetingId)/decision") { dataArray, ack in
            let json = dataArray[0] as? [String: Any]
            let decision = json?["decision"] as! [String:Any]?

            if decision != nil {
                MeetingManager.sharedInstance.currentDecisionId = decision?["_id"] as! String
                print("decision \(decision?["_id"] as! String)")
            }
        }
    }

    func closeConnection() {
        socket.disconnect()
    }
}
