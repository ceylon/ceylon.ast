import ceylon.ast.core {
    GroupedType,
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    groupedTypeToCeylon,
    compileGroupedType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JGroupedType=GroupedType
    }
}

shared object groupedType satisfies ConcreteTest<GroupedType,JGroupedType> {
    
    String->GroupedType construct(String->Type inner)
            => "<``inner.key``>"->GroupedType(inner.item);
    
    shared String->GroupedType stringGroupedType = construct(baseType.stringType);
    shared String->GroupedType iterableOfStringGroupedType = construct(baseType.iterableOfStringType);
    
    compile = compileGroupedType;
    fromCeylon = RedHatTransformer.transformGroupedType;
    toCeylon = groupedTypeToCeylon;
    codes = [stringGroupedType, iterableOfStringGroupedType];
}
