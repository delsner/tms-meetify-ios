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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //@IBAction func changeColor(_ sender: Any) {
       // colorChangeButton.layer.cornerRadius = 0.5 * colorChangeButton.bounds.size.width
        
       // if colorChangeButton.backgroundColor == UIColor.blue {
       //     colorChangeButton.backgroundColor = UIColor.red
        //} else {
       //     colorChangeButton.backgroundColor = UIColor.blue
    
    //Push MissingTargetButton
    @IBAction func pushMissingTarget(_ sender: Any) {
        let parameters = ["user":["ID": MeetingManager.sharedInstance.currentUserId, "eventType": "fast"]] as Dictionary<String, Any>
        
        let url = URL(string: "http://110.177.255.172:4000/api/meeting/\(MeetingManager.sharedInstance.currentMeetingId)/eventType")! //change the url

        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: missingTargetCompletion)
    }
    
    func missingTargetCompletion(result: [String: Any]) {
        print("fast")
    }
    
    //Push SlowDownButton
    @IBAction func pushSlowDown(_ sender: Any) {
        let parameters = ["user":["ID": MeetingManager.sharedInstance.currentUserId, "eventType": "slow"]] as Dictionary<String, Any>
        
        let url = URL(string: "http://10.177.255.172:4000/api/meeting/\(MeetingManager.sharedInstance.currentMeetingId)/eventType")! //change the url
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: SlowDownCompletion)
    }
    
    func SlowDownCompletion(result: [String: Any]) {
        print("slow")
    }
    
    //Push NewNoteButton
    @IBAction func pushNote(_ sender: Any) {
        let parameters = ["user":["ID": MeetingManager.sharedInstance.currentUserId, "tagType": "Note"]] as Dictionary<String, Any>
        
        let url = URL(string: "http://10.177.255.172:4000/api/meeting/\(MeetingManager.sharedInstance.currentMeetingId)/start")! //change the url
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: NoteCompletion)
    }
    
    func NoteCompletion(result: [String: Any]) {
        print("Note")

    }
    
    //Push AgreementButton
    @IBAction func pushAgreement(_ sender: Any) {
        let parameters = ["user":["ID": MeetingManager.sharedInstance.currentUserId, "tagType": "Agreement"]] as Dictionary<String, Any>
        
        let url = URL(string: "http://10.177.254.171:4000/api/meeting/\(MeetingManager.sharedInstance.currentMeetingId)/start")! //change the url
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: AgreementCompletion)
    }
    
    func AgreementCompletion(result: [String: Any]) {
        print("Agreement")
    }
    
    //Push ToDoButton
    @IBAction func pushToDo(_ sender: Any) {
        let parameters = ["user":["ID": MeetingManager.sharedInstance.currentUserId, "tagType": "ToDo"]] as Dictionary<String, Any>
        
        let url = URL(string: "http://110.177.254.171:4000/api/meeting/\(MeetingManager.sharedInstance.currentMeetingId)/start")! //change the url
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: ToDoCompletion)
    }
    
    func ToDoCompletion(result: [String: Any]) {
        print("ToDo")
    }
    
    //Vote with Yes Button
    @IBAction func VoteYes(_ sender: Any) {
        let parameters = ["user":["ID": MeetingManager.sharedInstance.currentUserId, "Vote": "Yes"]] as Dictionary<String, Any>
        
        let url = URL(string: "http://10.177.254.171:4000/api/meeting/\(MeetingManager.sharedInstance.currentMeetingId)/vote")! //change the url
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: VoteYesCompletion)
    }
    
    func VoteYesCompletion(result: [String: Any]) {
        print("Yes")
    }
    
    //Vote with No Button
    @IBAction func VoteNo(_ sender: Any) {
        let parameters = ["user":["ID": MeetingManager.sharedInstance.currentUserId, "Vote": "No"]] as Dictionary<String, Any>
        
        let url = URL(string: "http://10.177.254.171:4000/api/meeting/\(MeetingManager.sharedInstance.currentMeetingId)/vote")! //change the url
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: VoteNoCompletion)
    }
    
    func VoteNoCompletion(result: [String: Any]) {
        print("No")
    }
}





