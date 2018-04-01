import ceylon.ast.core {
    IntersectionType,
    PrimaryType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    intersectionTypeToCeylon,
    parseIntersectionType
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectionType=IntersectionType
    }
}

shared object intersectionType satisfies ConcreteTest<IntersectionType,JIntersectionType> {
    
    String->IntersectionType construct(<String->PrimaryType>+ children)
            => "&".join(children.collect(Entry<String,PrimaryType>.key)) -> IntersectionType(children.collect(Entry<String,PrimaryType>.item));
    
    shared String->IntersectionType persistentAndPrintableAndIdentifiableIntersectionType
            = construct(baseType.persistentType, baseType.printableType, baseType.identifiableType);
    
    parse = parseIntersectionType;
    fromCeylon = RedHatTransformer.transformIntersectionType;
    toCeylon = intersectionTypeToCeylon;
    codes = [persistentAndPrintableAndIdentifiableIntersectionType];
}
