//
//  RequestManagerClass.swift
//  RequiredClass
//
//  Created by Hardik on 15/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import Foundation
class RequestManager:NSObject{
    
    //Singleton class
    static let shared:RequestManager = RequestManager()
    
    public func requestWithPOST(stringUrl:String,parameters:Any,isToken:Bool,completion:@escaping(_ status:Bool,_ response:Data,_ message:String)->())
    {
        print("Request Parameter",parameters)
        print("Base URL",stringUrl)
        
        let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        let url = NSURL(string:stringUrl)
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.timeoutInterval = 120
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if(isToken)
        {
          //  request.setValue(NSShareManager.shared.token, forHTTPHeaderField:"auth_token")
        }
        request.httpBody = jsonData
        
        requestMethod(request:request) { (status, response, message) in
            completion(status,response,message)
        }
    }
    
    public func requestWithGET(stringUrl:String,isToken:Bool,completion:@escaping(_ status:Bool,_ response:NSData,_ message:String)->())
    {
        print("Base URL",stringUrl)
        
        let url = NSURL(string:stringUrl)
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "GET"
        request.timeoutInterval = 120
        if(isToken)
        {
           // request.setValue(NSShareManager.shared.token, forHTTPHeaderField:"auth_token")
        }
        requestMethod(request:request) { (status, response, message) in
            completion(status,response as NSData,message)
        }
    }
    
    private func requestMethod(request:URLRequest,completion:@escaping(_ status:Bool,_ response:Data,_ message:String)->())
    {
        guard (NetworkManager.isConnectedToNetwork()) else {
            print("No internet connecton!")
            return
        }
        SwiftLoader.show(animated:true)
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            DispatchQueue.main.async {
                do {
                    SwiftLoader.hide()
                    guard let dataRes = data else{
                        completion(false,Data(),(error?.localizedDescription)!);
                        return}
                    completion(true,dataRes ,"True")
                }
                catch let err{
                    completion(false,Data(),err.localizedDescription)
                    SwiftLoader.hide()
                }
            }
            }.resume()
    }
}
