import ceylon.ast.core {
    Parameter,
    Parameters
}

"Converts a stream of [[parameters]] to a [[Parameters]] object."
Parameters parameters_internal(Parameters|{Parameter*} parameters) {
    if (is Parameters parameters) {
        return parameters;
    } else {
        return Parameters(parameters.sequence());
    }
}

Parameters? optionalParameters_internal(Parameters|{Parameter*}? parameters) {
    if (exists parameters) { return parameters_internal(parameters); }
    else { return null; }
}

[Parameters+] parameterLists_internal({Parameters+}|Parameters|{Parameter*} parameters) {
    if (is Parameters parameters) {
        return [parameters];
    } else if (is {Parameters+} parameters) {
        assert (nonempty ret = parameters.sequence());
        return ret;
    } else {
        return [parameters_internal(parameters)];
    }
}
