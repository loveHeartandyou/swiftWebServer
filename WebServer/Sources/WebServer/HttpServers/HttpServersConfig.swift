//
//  HttpServers.swift
//  WebServer
//
//  Created by apple on 2019/1/25.
//

import Foundation
import PerfectHTTP
import PerfectHTTPServer

public class HttpServerConfig {
    static let serversConfig:Dictionary = [
        "servers":[
            [
                "name":"localhost",
                "port":80,
                "documentRoot":documentPath,
                "routes":[
                    ["method":"get", "uri":"/", "handler":HttpServerHandlers.indexHandlers],
                    ["method":"get", "uri":"/upload", "handler":HttpServerHandlers.uploadFile,"documentRoot":documentPath,],
                    ["method":"get", "uri":"/**", "handler":PerfectHTTPServer.HTTPHandler.staticFiles,
                     "documentRoot":"/",
                     "allowResponseFilters":true]
                ]
            ]
        ]
    ]
}
