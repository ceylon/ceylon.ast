import ceylon.ast.core {
    nameWithTypeArguments,
    QualifiedExpression,
    TypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInferredTypeArguments=InferredTypeArguments,
        JQualifiedMemberOrTypeExpression=QualifiedMemberOrTypeExpression,
        JStaticType=StaticType,
        JType=Type,
        JTypeArgumentList=TypeArgumentList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[QualifiedMemberOrTypeExpression|JQualifiedMemberOrTypeExpression]]
 to a `ceylon.ast` [[QualifiedExpression]]."
shared QualifiedExpression qualifiedExpressionToCeylon(JQualifiedMemberOrTypeExpression qualifiedMemberOrTypeExpression) {
    assert (is JTypeArgumentList|JInferredTypeArguments jTypeArguments = qualifiedMemberOrTypeExpression.typeArguments);
    TypeArguments? typeArguments;
    switch (jTypeArguments)
    case (is JTypeArgumentList) {
        assert (nonempty args = CeylonIterable(jTypeArguments.types).collect((JType jType) {
                    assert (is JStaticType jType);
                    return typeToCeylon(jType);
                }));
        typeArguments = args;
    }
    case (is JInferredTypeArguments) {
        typeArguments = null;
    }
    return QualifiedExpression(primaryToCeylon(qualifiedMemberOrTypeExpression.primary), nameWithTypeArguments(identifierToCeylon(qualifiedMemberOrTypeExpression.identifier), typeArguments));
}

"Compiles the given [[code]] for a Qualified Expression
 into a [[QualifiedExpression]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared QualifiedExpression? compileQualifiedExpression(String code) {
    value parser = createParser(code);
    if (is JQualifiedMemberOrTypeExpression jQualifiedMemberOrTypeExpression = parser.primary()) {
        return qualifiedExpressionToCeylon(jQualifiedMemberOrTypeExpression);
    } else {
        return null;
    }
    /*
     WARNING:
     I first implemented this using the grammar rules `base` and `qualifiedReference`,
     constructing the qualified expression from them myself.
     This _failed_ for the code "process.arguments.first", because the `base` was then only
     "process", not "process.arguments".
     I’m not sure why `base` isn’t greedy and `primary` is, but anyways… don’t try to “optimize” it
     like I wanted to.
     */
}
