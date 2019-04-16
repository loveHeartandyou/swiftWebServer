import PerfectLib
import PerfectHTTP
import PerfectHTTPServe

let m:String = "{id}"
var k:String = String(m[m.index(after: m.startIndex)..<m.index(before: m.endIndex)])

do {
    // Launch the servers based on the configuration data.
    try HTTPServer.launch(configurationData: HttpServerConfig.serversConfig)
} catch {
    fatalError("\(error)") // fatal error launching one of the servers
}
