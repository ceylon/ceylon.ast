import ceylon.ast.core {
    ClassBody,
    ExtendedType,
    ObjectExpression,
    SatisfiedTypes
}
import ceylon.ast.redhat {
    RedHatTransformer,
    objectExpressionToCeylon,
    parseObjectExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JObjectExpression=ObjectExpression
    }
}

shared object objectExpression satisfies ConcreteTest<ObjectExpression,JObjectExpression> {
    
    String->ObjectExpression construct(String->ClassBody body, <String->ExtendedType>? extendedType = null, <String->SatisfiedTypes>? satisfiedTypes = null)
            => "object `` extendedType?.key else "" `` `` satisfiedTypes?.key else "" `` ``body.key``"->ObjectExpression(body.item, extendedType?.item, satisfiedTypes?.item);
    
    shared String->ObjectExpression emptyObjectExpression = construct(classBody.emptyClassBody);
    shared String->ObjectExpression inheritanceObjectExpression = construct(classBody.emptyClassBody, extendedType.superInnerOfStringExtendedType, satisfiedTypes.satisfiesStringStarAndPrintableSatisfiedTypes);
    
    parse = parseObjectExpression;
    fromCeylon = RedHatTransformer.transformObjectExpression;
    toCeylon = objectExpressionToCeylon;
    codes = [emptyObjectExpression, inheritanceObjectExpression];
}
