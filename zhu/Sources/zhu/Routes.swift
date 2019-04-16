//
//  Routes.swift
//  COpenSSL
//
//  Created by 朱振华 on 2019/4/15.
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
        let thisDir = Dir("~/Desktop/WebService/swiftWebServer/zhu")
        opt["key"]  = thisDir.path
        
        _ = try? response.setBody(json: opt)
        response.completed()
    }
    routes.add(method: HTTPMethod.get, uri: "/upload", handler: Handlers.uploadFile)
    
    routes.add(method: .get, uri: "/download/**") { (request, response) in
        // 获得符合通配符的请求路径
        request.path = request.urlVariables[routeTrailingWildcardKey] ?? ""
        
        // 用文档根目录初始化静态文件句柄
        let handler = StaticFileHandler(documentRoot: documentRoot + "/download")
        // 用我们的根目录和路径
        // 修改集触发请求的句柄
        handler.handleRequest(request: request, response: response)
    }
    
    routes.add(method: .get, uri: "/file/**") { (request, response) in
        // 获得符合通配符的请求路径
        request.path = request.urlVariables[routeTrailingWildcardKey] ?? ""
        
        // 用文档根目录初始化静态文件句柄
        let handler = StaticFileHandler(documentRoot: documentRoot + "/var/html/www/")
        
        // 用我们的根目录和路径
        // 修改集触发请求的句柄
        handler.handleRequest(request: request, response: response)
    }
    return routes
}

