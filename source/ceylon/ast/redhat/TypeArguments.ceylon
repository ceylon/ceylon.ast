import ceylon.ast.core {
    TypeArguments,
    TypeArgument,
    Variance
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInferredTypeArguments=InferredTypeArguments,
        JStaticType=StaticType,
        JType=Type,
        JTypeArguments=TypeArguments,
        JTypeArgumentList=TypeArgumentList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts RedHat AST [[TypeArgumentList|JTypeArgumentList]] to `ceylon.ast` [[TypeArguments]].
 
 (This function does not accept [[TypeArguments|JTypeArguments]],
 which include [[InferredTypeArguments|JInferredTypeArguments]];
 use [[anyTypeArgumentsToCeylon]] for that.)"
shared TypeArguments typeArgumentsToCeylon(JTypeArgumentList typeArguments) {
    return TypeArguments(CeylonIterable(typeArguments.types).collect((JType jType) {
                assert (is JStaticType jType);
                value type = typeToCeylon(jType);
                Variance? variance;
                if (exists jTypeVariance = jType.typeVariance) {
                    variance = varianceToCeylon(jTypeVariance);
                } else {
                    variance = null;
                }
                return TypeArgument(type, variance);
            }));
}

"Converts RedHat AST [[TypeArguments|JTypeArguments]] to `ceylon.ast` [[TypeArguments]] or [[null]].
 
 Returns
 - `typeArgumentsToCeylon(typeArguments)` for a proper [[TypeArgumentList|JTypeArgumentList]],
 - `null` for [[InferredTypeArguments|JInferredTypeArguments]]."
shared TypeArguments? anyTypeArgumentsToCeylon(JTypeArguments typeArguments) {
    assert (is JTypeArgumentList|JInferredTypeArguments typeArguments);
    switch (typeArguments)
    case (is JTypeArgumentList) { return typeArgumentsToCeylon(typeArguments); }
    case (is JInferredTypeArguments) { return null; }
}

"Compiles the given [[code]] for Type Arguments
 into a [[TypeArguments]] using the Ceylon compiler
 (more specifically, the rule for `typeArguments`)."
shared TypeArguments? compileTypeArguments(String code) {
    if (exists jTypeArguments = createParser(code).typeArguments()) {
        return typeArgumentsToCeylon(jTypeArguments);
    } else {
        return null;
    }
}
