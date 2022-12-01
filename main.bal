import ballerina/http;

listener http:Listener httpListener = new (8081);

service / on httpListener {
    resource function get greet(string apiKey) returns string|error { 
        final http:Client clientEndpoint = check new ("https://06cb8ee0-8f8c-483f-b99e-60cb1b22eb9c-dev.e1-us-east-azure.choreoapis.dev/30nm/greeting/1.0.0");
        string resp = check clientEndpoint->get("/greeting", {"accept": "text/plain", 
            "API-Key": apiKey});
        return resp + " Lasith";
    }
}