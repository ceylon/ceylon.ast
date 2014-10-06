import ceylon.ast.core {
    Parameter,
    Parameters
}

"Something that can readily be converted to [[Parameters]]
 using the [[parameters]] utility function."
shared alias ParametersIsh => Parameters|{Parameter*};

"Converts a stream of [[parameters]] to a [[Parameters]] object."
shared Parameters parameters(ParametersIsh parameters) {
    if (is Parameters parameters) {
        return parameters;
    } else {
        assert (is {Parameter*} parameters);
        return Parameters(parameters.sequence());
    }
}
