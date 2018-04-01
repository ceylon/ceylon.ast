import ceylon.ast.core {
    Node,
    VariablePattern,
    UnspecifiedVariable,
    Type,
    ValueModifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JStaticType=StaticType,
        JValueModifier=ValueModifier,
        JVariablePattern=VariablePattern
    }
}

"Converts a RedHat AST [[VariablePattern|JVariablePattern]] to a `ceylon.ast` [[VariablePattern]]."
shared VariablePattern variablePatternToCeylon(JVariablePattern variablePattern, Anything(JNode, Node) update = noop) {
    Type|ValueModifier? type;
    value jVariable = variablePattern.variable;
    value jType = jVariable.type;
    if (is JStaticType jType) {
        type = typeToCeylon(jType, update);
    } else {
        assert (is JValueModifier jType);
        // The parser creates a ValueModifier with null token if the type is missing completely
        type = jType.mainToken exists then valueModifierToCeylon(jType, update) else null;
    }
    value variable = UnspecifiedVariable(lIdentifierToCeylon(jVariable.identifier, update), type);
    update(jVariable, variable);
    value result = VariablePattern(variable);
    update(variablePattern, result);
    return result;
}

"Parses the given [[code]] for a Variable Pattern
 into a [[VariablePattern]] using the Ceylon compiler
 (more specifically, the rule for a `variablePattern`)."
shared VariablePattern? parseVariablePattern(String code, Anything(JNode, Node) update = noop) {
    if (exists jVariablePattern = createParser(code + ",").variablePattern()) {
        // the parser needs that comma sometimes
        return variablePatternToCeylon(jVariablePattern, update);
    } else {
        return null;
    }
}
