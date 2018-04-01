import ceylon.ast.core {
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeToCeylon,
    parseType
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType
    }
}

shared object type satisfies AbstractTest<Type,JStaticType> {
    parse = parseType;
    fromCeylon = RedHatTransformer.transformType;
    toCeylon = typeToCeylon;
    
    tests = [entryType, mainType];
}
