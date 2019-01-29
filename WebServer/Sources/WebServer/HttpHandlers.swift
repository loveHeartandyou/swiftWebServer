//
//  HttpHandlers.swift
//  COpenSSL
//
//  Created by apple on 2019/1/24.
//

import PerfectLib
import PerfectHTTP
import PerfectSession
import Foundation

public class HttpHandlers {
    static func indexHandlers(request:HTTPRequest, _ response:HTTPResponse) {
        var opt = [String: Any]()
        opt["sessionid"] = request.session?.token
        opt["dump"] = request.session?.data
        _ = try? response.setBody(json: opt)
        response.completed()
    }
    static func uploadfile(data: [String:Any]) throws -> RequestHandler {
        return {
            request, response in
            
            let fileDir = Dir("/Users/apple/Documents/Git/swiftWebServer/WebServer/" + "files")
            do {
                try fileDir.create()
            } catch {
                print(error)
            }

            if let uploads = request.postFileUploads, uploads.count > 0 {
                var ary = [[String:Any]]()

                for upload in uploads {
                    ary.append([
                        "fieldName": upload.fieldName,  //字段名
                        "contentType": upload.contentType, //文件内容类型
                        "fileName": upload.fileName,    //文件名
                        "fileSize": upload.fileSize,    //文件尺寸
                        "tmpFileName": upload.tmpFileName   //上载后的临时文件名
                        ])
                    let thisFile = File(upload.tmpFileName)
                    do {
                        let _ = try thisFile.moveTo(path: fileDir.path + upload.fileName, overWrite: true)
                    } catch {
                        print(error)
                    }

                }
            }
            response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world! Port 80</body></html>")
            // Ensure that response.completed() is called when your processing is done.
            response.completed()
        }
    }
}
