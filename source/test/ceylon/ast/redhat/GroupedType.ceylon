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
    
    shared actual GroupedType? compile(String code) => compileGroupedType(code);
    shared actual JGroupedType fromCeylon(RedHatTransformer transformer)(GroupedType node) => transformer.transformGroupedType(node);
    shared actual GroupedType toCeylon(JGroupedType node) => groupedTypeToCeylon(node);
    codes = [stringGroupedType, iterableOfStringGroupedType];
}
