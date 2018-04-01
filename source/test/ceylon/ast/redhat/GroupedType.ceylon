import ceylon.ast.core {
    GroupedType,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    groupedTypeToCeylon,
    parseGroupedType
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JGroupedType=GroupedType
    }
}

shared object groupedType satisfies ConcreteTest<GroupedType,JGroupedType> {
    
    String->GroupedType construct(String->Type inner)
            => "<``inner.key``>" -> GroupedType(inner.item);
    
    shared String->GroupedType stringGroupedType = construct(baseType.stringType);
    shared String->GroupedType iterableOfStringGroupedType = construct(baseType.iterableOfStringType);
    
    parse = parseGroupedType;
    fromCeylon = RedHatTransformer.transformGroupedType;
    toCeylon = groupedTypeToCeylon;
    codes = [stringGroupedType, iterableOfStringGroupedType];
}
