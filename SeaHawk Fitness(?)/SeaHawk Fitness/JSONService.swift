//
//  JSONService.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 3/25/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class JSONService
{
    static let sharedInstance = JSONService()
    
    let baseURL = "http://webdev.cislabs.uncw.edu/~jsg6998/SeahawkFitness/API/"
    let session = NSURLSession.sharedSession()
    
    func getJSON(SpecifyAPI: NSString, ReqARGs: NSString, onCompletion: (JSON) -> Void) {
        let route = NSURL(string: baseURL + (SpecifyAPI as String) + ".php")
        
        makeRequest(route!, RequestARGs: ReqARGs , onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    private func makeRequest(URL: NSURL, RequestARGs: NSString, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: URL)
        let postString = RequestARGs.dataUsingEncoding(NSUTF8StringEncoding)
        
        do {
            print("Make Request Function Call")
            request.HTTPMethod = "POST"
            //request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = postString
            print(URL)
            print(RequestARGs)
            let session = NSURLSession.sharedSession()
            
            let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                if let jsonData = data {
                    let json:JSON = JSON(data: jsonData)
                    print(json)
                    let results = NSString(data:data!, encoding:NSUTF8StringEncoding)
                    print("API Response: \(results)")
                    onCompletion(json, nil)
                } else {
                    print("There was an error in creating the JSON")
                    onCompletion(nil, error)
                }
            })
            task.resume()
        } catch {
            // Create your personal error
            print("Catch Error")
            onCompletion(nil, nil)
        }    }
    
    
}
