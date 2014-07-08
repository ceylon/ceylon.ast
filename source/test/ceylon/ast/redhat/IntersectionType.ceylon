import ceylon.ast.core {
    IntersectionType,
    PrimaryType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    intersectionTypeToCeylon,
    compileIntersectionType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectionType=IntersectionType
    }
}

shared object intersectionType satisfies ConcreteTest<IntersectionType,JIntersectionType> {
    
    String->IntersectionType construct(<String->PrimaryType>+ children)
            => "&".join(children.collect(Entry<String,PrimaryType>.key))->IntersectionType(children.collect(Entry<String,PrimaryType>.item));
    
    shared String->IntersectionType persistentAndPrintableAndIdentifiableIntersectionType
            = construct(baseType.persistentType, baseType.printableType, baseType.identifiableType);
    
    shared actual IntersectionType? compile(String code) => compileIntersectionType(code);
    shared actual JIntersectionType fromCeylon(RedHatTransformer transformer)(IntersectionType node) => transformer.transformIntersectionType(node);
    shared actual IntersectionType toCeylon(JIntersectionType node) => intersectionTypeToCeylon(node);
    codes = [persistentAndPrintableAndIdentifiableIntersectionType];
}
