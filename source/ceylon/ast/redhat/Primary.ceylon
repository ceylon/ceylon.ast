import ceylon.ast.core {
    Primary
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
        JPackageLiteral=PackageLiteral,
        JPrimary=Primary,
        JQualifiedMemberOrTypeExpression=QualifiedMemberOrTypeExpression,
        JTypeParameterLiteral=TypeParameterLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[Primary|JPrimary]] to a `ceylon.ast` [[Primary]]."
shared Primary primaryToCeylon(JPrimary primary) {
    switch (primary)
    case (is JAtom) {
        if (is JExpression primary, !primary.mainToken exists) {
            // a JTerm wrapped in a JExpression
            assert (is Primary ret = expressionToCeylon(primary.term));
            return ret;
        }
        return atomToCeylon(primary);
    }
    case (is JBaseMemberOrTypeExpression) { return baseExpressionToCeylon(primary); }
    case (is JQualifiedMemberOrTypeExpression) { return qualifiedExpressionToCeylon(primary); }
    case (is JInvocationExpression) { return invocationToCeylon(primary); }
    case (is JIndexExpression) { return elementOrSubrangeExpressionToCeylon(primary); }
    case (is JMetaLiteral) {
        // the type test is a bit complicated because the dec types are subtypes of the meta types
        if (is JClassLiteral|JInterfaceLiteral|JAliasLiteral|JTypeParameterLiteral|JValueLiteral|JFunctionLiteral|JModuleLiteral|JPackageLiteral primary) {
            return decToCeylon(primary);
        } else {
            return metaToCeylon(primary);
        }
    }
    else {
        throw AssertionError("Unknown primary type, or not a primary");
    }
}

"Compiles the given [[code]] for a Primary
 into a [[Primary]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared Primary? compilePrimary(String code) {
    if (exists jPrimary = createParser(code).primary()) {
        return primaryToCeylon(jPrimary);
    } else {
        return null;
    }
}
