import ceylon.ast.core {
    Parameter,
    Parameters
}

"Converts a stream of [[parameters]] to a [[Parameters]] object."
Parameters parameters_internal(Parameters|{Parameter*} parameters) {
    if (is Parameters parameters) {
        return parameters;
    } else {
        assert (is {Parameter*} parameters);
        return Parameters(parameters.sequence());
    }
}
