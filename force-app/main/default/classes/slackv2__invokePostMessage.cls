/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class invokePostMessage {
    global invokePostMessage() {

    }
    @InvocableMethod(label='Slack: Post Message' description='Posts a message to a Slack channel')
    global static void postMessage(List<slackv2.invokePostMessage.PostMessageRequest> requests) {

    }
global class PostMessageRequest {
    @InvocableVariable(label='Message' required=false)
    global String message;
    @InvocableVariable(label='Message Destination ID' required=true)
    global Id messageDestinationId;
    @InvocableVariable(label='Record ID' required=true)
    global Id recordId;
    global PostMessageRequest() {

    }
}
}
