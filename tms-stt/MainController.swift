//
//  ViewController.swift
//  tms-stt
//
//  Created by Daniel Elsner on 05.04.17.
//  Copyright © 2017 Elsner & Mense GbR. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var btn_Target: UIButton!
    @IBOutlet weak var btn_Slow: UIButton!
    @IBOutlet weak var btn_Agree: UIButton!
    @IBOutlet weak var btn_No: UIButton!
    @IBOutlet weak var btn_Yes: UIButton!
    @IBOutlet weak var btn_Note: UIButton!
    @IBOutlet weak var btn_ToDo: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        MeetingManager.subscribeToSockets(completionHandler: updateView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateView() {
        DispatchQueue.main.async {
            self.btn_Note.layer.borderWidth = 0
            self.btn_Agree.layer.borderWidth = 0
            self.btn_ToDo.layer.borderWidth = 0
            if MeetingManager.sharedInstance.recording {
                if MeetingManager.sharedInstance.recordingTag == "NOTE" {
                    self.btn_Note.layer.borderWidth = 2
                    self.btn_Note.layer.borderColor = UIColor.blue.cgColor
                } else if MeetingManager.sharedInstance.recordingTag == "AGREEMENT" {
                    self.btn_Agree.layer.borderWidth = 2
                    self.btn_Agree.layer.borderColor = UIColor.blue.cgColor
                } else if MeetingManager.sharedInstance.recordingTag == "TASK" {
                    self.btn_ToDo.layer.borderWidth = 2
                    self.btn_ToDo.layer.borderColor = UIColor.blue.cgColor
                }
            }
        }
    }

    //Push MissingTarget
    @IBAction func pushMissingTarget(_ sender: Any) {
        let parameters = ["user": MeetingManager.sharedInstance.userId, "eventType": "FOCUS"] as Dictionary<String, Any>

        let url = URL(string: "\(MeetingManager.url)\(MeetingManager.sharedInstance.currentMeetingId)/speed")! //change the url

        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: missingTargetCompletion)
    }
    
    func missingTargetCompletion(result: [String: Any]) {
        print("fast")
    }

    //Push SlowDown
    @IBAction func pushSlowDown(_ sender: Any) {
        let parameters = ["user": MeetingManager.sharedInstance.userId, "eventType": "SLOW"] as Dictionary<String, Any>
        
        let url = URL(string: "\(MeetingManager.url)\(MeetingManager.sharedInstance.currentMeetingId)/speed")! //change the url
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: SlowDownCompletion)
    }
    
    func SlowDownCompletion(result: [String: Any]) {
        print("slow")
    }
    
    //Push NewNoteButton
    @IBAction func pushNote(_ sender: Any) {
        let parameters = ["user": MeetingManager.sharedInstance.userId, "tagType": "NOTE"] as Dictionary<String, Any>
        
        var startStop = "start"
        if MeetingManager.sharedInstance.recording {
            startStop = "stop"
        }

        let url = URL(string: "\(MeetingManager.url)\(MeetingManager.sharedInstance.currentMeetingId)/\(startStop)")!
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: NoteCompletion)
    }
    
    func NoteCompletion(result: [String: Any]) {
        print("Note")

    }
    
    //Push AgreementButton
    @IBAction func pushAgreement(_ sender: Any) {
        let parameters = ["user": MeetingManager.sharedInstance.userId, "tagType": "AGREEMENT"] as Dictionary<String, Any>

        var startStop = "start"
        if MeetingManager.sharedInstance.recording {
            startStop = "stop"
        }

        let url = URL(string: "\(MeetingManager.url)\(MeetingManager.sharedInstance.currentMeetingId)/\(startStop)")!

        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: AgreementCompletion)
    }
    
    func AgreementCompletion(result: [String: Any]) {
        print("Agreement")
    }
    
    //Push ToDoButton
    @IBAction func pushToDo(_ sender: Any) {
        let parameters = ["user": MeetingManager.sharedInstance.userId, "tagType": "TASK"] as Dictionary<String, Any>

        var startStop = "start"
        if MeetingManager.sharedInstance.recording {
            startStop = "stop"
        }

        let url = URL(string: "\(MeetingManager.url)\(MeetingManager.sharedInstance.currentMeetingId)/\(startStop)")!

        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: ToDoCompletion)
    }
    
    func ToDoCompletion(result: [String: Any]) {
        print("ToDo")
    }
    
    //Vote with Yes Button
    @IBAction func VoteYes(_ sender: Any) {
        let parameters = ["user": MeetingManager.sharedInstance.userId, "vote": "YES"] as Dictionary<String, Any>
        if MeetingManager.sharedInstance.currentDecisionId != "" {
            let url = URL(string: "\(MeetingManager.url)\(MeetingManager.sharedInstance.currentMeetingId)/decision/\(MeetingManager.sharedInstance.currentDecisionId)")!

            MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: ToDoCompletion as! (Any) -> Void)
        }
    }
    
    func VoteYesCompletion(result: [String: Any]) {
        print("Yes")
    }
    
    //Vote with No Button
    @IBAction func VoteNo(_ sender: Any) {
        let parameters = ["user": MeetingManager.sharedInstance.userId, "vote": "NO"] as Dictionary<String, Any>

        if MeetingManager.sharedInstance.currentDecisionId != "" {
            let url = URL(string: "\(MeetingManager.url)\(MeetingManager.sharedInstance.currentMeetingId)/decision/\(MeetingManager.sharedInstance.currentDecisionId)")!

            MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: ToDoCompletion as! (Any) -> Void)
        }
    }
    
    func VoteNoCompletion(result: [String: Any]) {
        print("No")
    }
}





