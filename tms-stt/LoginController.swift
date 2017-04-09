//
//  ViewController.swift
//  tms-stt
//
//  Created by Daniel Elsner on 05.04.17.
//  Copyright © 2017 Elsner & Mense GbR. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var meetingIdTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.meetingIdTextfield.delegate = self
        self.usernameTextfield.delegate = self
        self.emailTextfield.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginToMeeting(_ sender: Any) {
        let parameters = ["user":["name": usernameTextfield.text, "email": emailTextfield.text]] as Dictionary<String, Any>
        
        guard let meetingId = meetingIdTextfield.text else {
            return
        }
        
        let url = URL(string: "\(MeetingManager.url)\(meetingId)/signin")! //change the url
        
        MeetingManager.createRequest(url: url, parameters: parameters, completionHandler: loginHandler)
    }
    
    func loginHandler(result: [String: Any]) {

        MeetingManager.sharedInstance.currentMeetingId = result["meetingName"] as! String
        MeetingManager.sharedInstance.userId = result["currentUserId"] as! String
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "MainSegue", sender: self)
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

