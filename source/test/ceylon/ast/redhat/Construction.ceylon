import ceylon.ast.core {
    BaseType,
    Construction,
    MemberNameWithTypeArguments,
    PositionalArguments,
    Super,
    LIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    constructionToCeylon,
    parseConstruction
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression
    }
}

shared object construction satisfies ConcreteTest<Construction,JInvocationExpression> {
    
    String->Construction construct(String->MemberNameWithTypeArguments nameAndArgs, String->PositionalArguments arguments, <String->BaseType|Super>? qualifier)
            => "`` if (exists qualifier) then "``qualifier.key``." else "" ````nameAndArgs.key````arguments.key``" -> Construction(nameAndArgs.item, arguments.item, qualifier?.item);
    
    shared String->Construction pointCartesianConstruction = construct("cartesian" -> MemberNameWithTypeArguments(LIdentifier("cartesian")), positionalArguments.emptyPositionalArguments, baseType.pointType);
    shared String->Construction withRgbConstruction = construct("withRGB" -> MemberNameWithTypeArguments(LIdentifier("withRGB")), positionalArguments.emptyPositionalArguments, baseType.pointType);
    shared String->Construction superCartesianConstruction = construct("cartesian" -> MemberNameWithTypeArguments(LIdentifier("cartesian")), positionalArguments.emptyPositionalArguments, "super" -> Super());
    shared String->Construction pointCartesianOfStringConstruction = construct("cartesian<String>" -> MemberNameWithTypeArguments(LIdentifier("cartesian"), typeArguments.stringTypeArguments.item), positionalArguments.emptyPositionalArguments, baseType.pointType);
    shared String->Construction withRgbOfStringConstruction = construct("withRGB<String>" -> MemberNameWithTypeArguments(LIdentifier("withRGB"), typeArguments.stringTypeArguments.item), positionalArguments.emptyPositionalArguments, baseType.pointType);
    shared String->Construction superCartesianOfStringConstruction = construct("cartesian<String>" -> MemberNameWithTypeArguments(LIdentifier("cartesian"), typeArguments.stringTypeArguments.item), positionalArguments.emptyPositionalArguments, "super" -> Super());
    
    parse = parseConstruction;
    fromCeylon = RedHatTransformer.transformConstruction;
    toCeylon = constructionToCeylon;
    codes = [pointCartesianConstruction, withRgbConstruction, superCartesianConstruction, pointCartesianOfStringConstruction, withRgbOfStringConstruction, superCartesianOfStringConstruction];
}
