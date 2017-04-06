//
//  ViewController.swift
//  tms-stt
//
//  Created by Daniel Elsner on 05.04.17.
//  Copyright © 2017 Elsner & Mense GbR. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var meetingIdTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        //Drücken LoginButton -> Methode postCredentialsToLogin() wird aufgerufen
    @IBAction func loginToMeeting(_ sender: Any) {
        let parameters = ["user":["name": usernameTextfield.text, "email": emailTextfield.text]] as Dictionary<String, Any>
        
        guard let meetingId = meetingIdTextfield.text else {
            return
        }
        
        let url = URL(string: "http://10.177.255.172:4000/api/meeting/\(meetingId)/signin")! //change the url
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: loginHandler)
    }
    
    func loginHandler(result: [String: Any]) {
        MeetingManager.sharedInstance.currentMeetingId = result["meetingId"] as! String
        MeetingManager.sharedInstance.currentUserId = result["yourUserId"] as! String
    }
    
        
    
}

