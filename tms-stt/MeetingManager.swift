//
//  MeetingManager.swift
//  tms-stt
//
//  Created by Lorena Schlesinger on 05.04.17.
//  Copyright © 2017 Elsner & Mense GbR. All rights reserved.
//

import Foundation

class MeetingManager {
    static let sharedInstance = MeetingSession()

    static let url = "http://192.168.0.111:4000/api/meeting/"
    static let socketUrl = URL(string: "http://192.168.0.111:4000")!
    
    static func createRequest(url: URL, parameters: Dictionary<String, Any>, completionHandler: @escaping (_ result: [String: Any]) -> Void) {
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        /*
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    completionHandler(json)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
         */
        
    }

    static func subscribeToSockets(completionHandler: @escaping () -> Void) {
        SocketIOManager.sharedInstance.establishConnection(completionHandler: completionHandler)
    }

}
