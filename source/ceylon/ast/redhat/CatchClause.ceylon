import ceylon.ast.core {
    CatchClause,
    Type,
    UnspecifiedVariable,
    ValueModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCatchClause=CatchClause,
        JStaticType=StaticType,
        JValueModifier=ValueModifier
    }
}

"Converts a RedHat AST [[CatchClause|JCatchClause]] to a `ceylon.ast` [[CatchClause]]."
shared CatchClause catchClauseToCeylon(JCatchClause catchClause) {
    Type|ValueModifier? type;
    value jVariable = catchClause.catchVariable.variable;
    value jType = jVariable.type;
    if (is JStaticType jType) {
        type = typeToCeylon(jType);
    } else {
        assert (is JValueModifier jType);
        // The parser creates a ValueModifier with null token if the type is missing completely
        type = jType.mainToken exists then valueModifierToCeylon(jType) else null;
    }
    return CatchClause(UnspecifiedVariable(lIdentifierToCeylon(jVariable.identifier), type), blockToCeylon(catchClause.block));
}

"Compiles the given [[code]] for a Catch Clause
 into a [[CatchClause]] using the Ceylon compiler
 (more specifically, the rule for a `catchBlock`)."
shared CatchClause? compileCatchClause(String code) {
    if (exists jCatchBlock = createParser(code).catchBlock(),
        jCatchBlock.catchVariable exists) { // it’s optional in the grammar
        return catchClauseToCeylon(jCatchBlock);
    } else {
        return null;
    }
}
