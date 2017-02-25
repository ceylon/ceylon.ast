import ceylon.ast.core {
    CatchClause,
    Node,
    Type,
    UnspecifiedVariable,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JCatchClause=CatchClause,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[CatchClause|JCatchClause]] to a `ceylon.ast` [[CatchClause]]."
shared CatchClause catchClauseToCeylon(JCatchClause catchClause, Anything(JNode, Node) update = noop) {
    Type|ValueModifier? type;
    value jVariable = catchClause.catchVariable.variable;
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
    value result = CatchClause(variable, blockToCeylon(catchClause.block, update));
    update(catchClause, result);
    return result;
}

"Parses the given [[code]] for a Catch Clause
 into a [[CatchClause]] using the Ceylon compiler
 (more specifically, the rule for a `catchBlock`)."
shared CatchClause? parseCatchClause(String code, Anything(JNode, Node) update = noop) {
    if (exists jCatchBlock = createParser(code).catchBlock(),
        jCatchBlock.catchVariable exists) { // it’s optional in the grammar
        return catchClauseToCeylon(jCatchBlock, update);
    } else {
        return null;
    }
}
