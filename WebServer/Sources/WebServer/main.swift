import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

do {
    // Launch the servers based on the configuration data.
    try HTTPServer.launch(configurationData: HttpServerConfig.serversConfig)
} catch {
    fatalError("\(error)") // fatal error launching one of the servers
}
