import ceylon.ast.core {
    UnionableType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unionableTypeToCeylon,
    parseUnionableType
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType
    }
}

shared object unionableType satisfies AbstractTest<UnionableType,JStaticType> {
    parse = parseUnionableType;
    fromCeylon = RedHatTransformer.transformUnionableType;
    toCeylon = unionableTypeToCeylon;
    
    tests = [intersectionType, primaryType];
}
