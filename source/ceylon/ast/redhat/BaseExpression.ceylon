import ceylon.ast.core {
    BaseExpression,
    nameWithTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseMemberOrTypeExpression=BaseMemberOrTypeExpression,
        JBaseMemberExpression=BaseMemberExpression,
        JBaseTypeExpression=BaseTypeExpression,
        JTypeArgumentList=TypeArgumentList,
        JInferredTypeArguments=InferredTypeArguments
    }
}

"Converts a RedHat AST [[BaseMemberOrTypeExpression|JBaseMemberOrTypeExpression]]
 to a `ceylon.ast` [[BaseExpression]]."
shared BaseExpression baseExpressionToCeylon(JBaseMemberOrTypeExpression baseMemberOrTypeExpression) {
    assert (is JTypeArgumentList|JInferredTypeArguments jTypeArguments = baseMemberOrTypeExpression.typeArguments);
    return BaseExpression(nameWithTypeArguments(identifierToCeylon(baseMemberOrTypeExpression.identifier), anyTypeArgumentsToCeylon(baseMemberOrTypeExpression.typeArguments)));
}

"Compiles the given [[code]] for a Base Expression
 into a [[BaseExpression]] using the Ceylon compiler
 (more specifically, the rule for a `baseReference`)."
shared BaseExpression? compileBaseExpression(String code) {
    if (exists jBaseReference = createParser(code).baseReference()) {
        JBaseMemberOrTypeExpression expr;
        if (jBaseReference.isMember) {
            expr = JBaseMemberExpression(null);
        } else {
            expr = JBaseTypeExpression(null);
        }
        expr.identifier = jBaseReference.identifier;
        expr.typeArguments = jBaseReference.typeArgumentList else JInferredTypeArguments(null);
        return baseExpressionToCeylon(expr);
    } else {
        return null;
    }
}
