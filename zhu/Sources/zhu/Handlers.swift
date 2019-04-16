//
//  Handlers.swift
//  COpenSSL
//
//  Created by 朱振华 on 2019/4/15.
//

import Foundation
import PerfectHTTP
import PerfectHTTPServer
import PerfectLib
import PerfectMongoDB

public class Handlers {
    static func uploadFile(request:HTTPRequest, _ response:HTTPResponse) {
        let find = collention?.find(query:BSON())
        var arr = [String]()
        
        for x in find! {
            arr.append(x.asString)
        }
        var opt = [String:Any]()
        opt["key"] = arr
        
        _ = try? response.setBody(json: opt)
        response.completed()
    }
}


