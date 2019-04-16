//
//  Handlers.swift
//  COpenSSL
//
//  Created by 朱振华 on 2019/1/26.
//

import Foundation
import PerfectHTTP
import PerfectHTTPServer
import PerfectLib

public class Handlers {
    static func uploadFile(request:HTTPRequest, _ response:HTTPResponse) {
        response.completed()
    }
}

