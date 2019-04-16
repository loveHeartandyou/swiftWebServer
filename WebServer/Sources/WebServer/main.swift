import PerfectLib
import PerfectHTTP
import PerfectHTTPServe

let m:String = "{id}"
var k:String = String(m[m.index(after: m.startIndex)..<m.index(before: m.endIndex)])

let server = HTTPServer()
server.serverPort = 8181;
server.addRoutes(makeRoutes())
do {
    try server.start()
} catch PerfectError.networkError(let err, let msg)  {
    
}
