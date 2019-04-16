//
//  Routes.swift
//  COpenSSL
//
//  Created by apple on 2019/1/23.
//

import PerfectLib
import PerfectHTTP
import PerfectSession

public func makeRoutes() -> Routes {
    var routes = Routes()
    routes.add(uri: "/") { (request:HTTPRequest, _ response:HTTPResponse) in
        var opt = [String: Any]()
        opt["sessionid"] = request.session?.token
        opt["dump"] = request.session?.data
        opt["key"]  = "zhuzhenhua"
        
        _ = try? response.setBody(json: opt)
        response.completed()
    }
    routes.add(method: HTTPMethod.get, uri: "/upload/{id}/{m}", handler: Handlers.uploadFile)
    return routes
}
