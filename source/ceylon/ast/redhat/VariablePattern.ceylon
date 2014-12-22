import ceylon.ast.core {
    VariablePattern,
    UnspecifiedVariable,
    Type,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType,
        JValueModifier=ValueModifier,
        JVariablePattern=VariablePattern
    }
}

"Converts a RedHat AST [[VariablePattern|JVariablePattern]] to a `ceylon.ast` [[VariablePattern]]."
shared VariablePattern variablePatternToCeylon(JVariablePattern variablePattern) {
    Type|ValueModifier? type;
    value jVariable = variablePattern.variable;
    value jType = jVariable.type;
    if (is JStaticType jType) {
        type = typeToCeylon(jType);
    } else {
        assert (is JValueModifier jType);
        // The parser creates a ValueModifier with null token if the type is missing completely
        type = jType.mainToken exists then valueModifierToCeylon(jType) else null;
    }
    return VariablePattern(UnspecifiedVariable(lIdentifierToCeylon(jVariable.identifier), type));
}

"Compiles the given [[code]] for a Variable Pattern
 into a [[VariablePattern]] using the Ceylon compiler
 (more specifically, the rule for a `variablePattern`)."
shared VariablePattern? compileVariablePattern(String code) {
    if (exists jVariablePattern = createParser(code).variablePattern()) {
        return variablePatternToCeylon(jVariablePattern);
    } else {
        return null;
    }
}
