/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MediaIntegrationProcedureInvocable {
    global MediaIntegrationProcedureInvocable() {

    }
    @InvocableMethod(label='Media Integration Procedure')
    global static List<vlocity_cmt.MediaIntegrationProcedureInvocable.MediaIntegrationProcedureOutput> runIntegrationServiceInvocable(List<vlocity_cmt.MediaIntegrationProcedureInvocable.MediaIntegrationProcedureInput> ipInputList) {
        return null;
    }
global class MediaIntegrationProcedureInput {
    @InvocableVariable(label='Input' required=false)
    global List<vlocity_cmt.MediaIntegrationProcedureMapEntry> input;
    @InvocableVariable(label='Procedure Name' required=false)
    global String procedureAPIName;
    global MediaIntegrationProcedureInput() {

    }
}
global class MediaIntegrationProcedureOutput {
    @InvocableVariable(label='Output' required=false)
    global String output;
    global MediaIntegrationProcedureOutput() {

    }
}
}
