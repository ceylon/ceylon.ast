import ceylon.ast.core {
    Node,
    TypeArguments,
    TypeArgument,
    Variance
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared TypeArguments typeArgumentsToCeylon(JTypeArgumentList typeArguments, Anything(JNode,Node) update = noop) {
    value result = TypeArguments(CeylonIterable(typeArguments.types).collect((JType jType) {
                assert (is JStaticType jType);
                value type = typeToCeylon(jType, update);
                Variance? variance;
                if (exists jTypeVariance = jType.typeVariance) {
                    variance = varianceToCeylon(jTypeVariance, update);
                } else {
                    variance = null;
                }
                value result = TypeArgument(type, variance);
                update(jType, result);
                return result;
            }));
    update(typeArguments, result);
    return result;
}

"Converts RedHat AST [[TypeArguments|JTypeArguments]] to `ceylon.ast` [[TypeArguments]] or [[null]].
 
 Returns
 - `typeArgumentsToCeylon(typeArguments, update)` for a proper [[TypeArgumentList|JTypeArgumentList]],
 - `null` for [[InferredTypeArguments|JInferredTypeArguments]] or [[null]]."
shared TypeArguments? anyTypeArgumentsToCeylon(JTypeArguments? typeArguments, Anything(JNode,Node) update = noop) {
    assert (is JTypeArgumentList|JInferredTypeArguments? typeArguments);
    switch (typeArguments)
    case (is JTypeArgumentList) { return typeArgumentsToCeylon(typeArguments, update); }
    case (is JInferredTypeArguments) { return null; }
    case (null) { return null; }
}

"Compiles the given [[code]] for Type Arguments
 into a [[TypeArguments]] using the Ceylon compiler
 (more specifically, the rule for `typeArguments`)."
shared TypeArguments? compileTypeArguments(String code, Anything(JNode,Node) update = noop) {
    if (exists jTypeArguments = createParser(code).typeArguments()) {
        return typeArgumentsToCeylon(jTypeArguments, update);
    } else {
        return null;
    }
}
