import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()
server.serverPort = 8181;
server.addRoutes(makeRoutes())
do {
    try server.start()
} catch PerfectError.networkError(let err, let msg)  {
    
}
