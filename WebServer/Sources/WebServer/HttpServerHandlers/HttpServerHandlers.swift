//
//  HttpServerHandlers.swift
//  WebServer
//
//  Created by apple on 2019/1/25.
//

import Foundation
import PerfectHTTPServer
import PerfectHTTP
import PerfectLib

public struct HttpServerHandlers {
    public static func indexHandlers(data:[String:Any]) throws -> RequestHandler {
        let handlers:RequestHandler = {
            request, response in
            var op = [String:Any]()
            op["code"] = 1001
            do {
                try response.appendBody(string: op.jsonEncodedString())
            } catch {
                
            }
            response.completed(status: HTTPResponseStatus.ok)
        }
        return handlers
    }
    public static func uploadFile(data:[String:Any]) throws -> RequestHandler {
        let uploadHanlder:RequestHandler = {
            (request, response) in
            var imgLabel = ""
            if let uploads = request.postFileUploads, uploads.count > 0 {
                let workingDir = Dir.workingDir
                for upload in uploads {
                    let tepFile = File(upload.tmpFileName)
                    do {
                        let _ = try tepFile.moveTo(path: workingDir.path + upload.fileName, overWrite: true)
                        imgLabel += "<img src=\"http://localhost/" + upload.fileName + "\" />"
                    } catch {
                        print(error)
                    }
                }
            }
            imgLabel = "<html><title>Hello, world!</title><body>" + imgLabel + "</body></html>"
            response.appendBody(string: imgLabel)
            response.completed(status: HTTPResponseStatus.ok)
        }
        return uploadHanlder;
    }
}
