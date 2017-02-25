import ceylon.ast.core {
    Node,
    Primary
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAliasLiteral=AliasLiteral,
        JInterfaceLiteral=InterfaceLiteral,
        JAtom=Atom,
        JBaseMemberOrTypeExpression=BaseMemberOrTypeExpression,
        JClassLiteral=ClassLiteral,
        JExpression=Expression,
        JFunctionLiteral=FunctionLiteral,
        JIndexExpression=IndexExpression,
        JInvocationExpression=InvocationExpression,
        JMetaLiteral=MetaLiteral,
        JModuleLiteral=ModuleLiteral,
        JNewLiteral=NewLiteral,
        JObjectExpression=ObjectExpression,
        JPackageLiteral=PackageLiteral,
        JParExpression=ParExpression,
        JPrimary=Primary,
        JQualifiedMemberOrTypeExpression=QualifiedMemberOrTypeExpression,
        JTypeParameterLiteral=TypeParameterLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[Primary|JPrimary]] to a `ceylon.ast` [[Primary]]."
shared Primary primaryToCeylon(JPrimary primary, Anything(JNode, Node) update = noop) {
    switch (primary)
    case (is JAtom) {
        if (is JExpression primary, !primary is JParExpression) {
            // a JTerm wrapped in a JExpression
            assert (is Primary ret = expressionToCeylon(primary.term, update));
            return ret;
        }
        return atomToCeylon(primary, update);
    }
    case (is JBaseMemberOrTypeExpression) { return baseExpressionToCeylon(primary, update); }
    case (is JQualifiedMemberOrTypeExpression) { return qualifiedExpressionToCeylon(primary, update); }
    case (is JInvocationExpression) { return invocationToCeylon(primary, update); }
    case (is JIndexExpression) { return elementOrSubrangeExpressionToCeylon(primary, update); }
    case (is JMetaLiteral) {
        // the type test is a bit complicated because the dec types are subtypes of the meta types
        if (is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral|JNewLiteral|JValueLiteral|JFunctionLiteral|JModuleLiteral|JPackageLiteral primary) {
            return decToCeylon(primary, update);
        } else {
            return metaToCeylon(primary, update);
        }
    }
    case (is JObjectExpression) { return objectExpressionToCeylon(primary, update); }
    else {
        throw AssertionError("Unknown primary type, or not a primary");
    }
}

"Parses the given [[code]] for a Primary
 into a [[Primary]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared Primary? parsePrimary(String code, Anything(JNode, Node) update = noop) {
    if (exists jPrimary = createParser(code).primary()) {
        return primaryToCeylon(jPrimary, update);
    } else {
        return null;
    }
}
