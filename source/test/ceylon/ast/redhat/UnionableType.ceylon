import ceylon.ast.core {
    UnionableType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unionableTypeToCeylon,
    compileUnionableType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType
    }
}

shared object unionableType satisfies AbstractTest<UnionableType,JStaticType> {
    compile = compileUnionableType;
    fromCeylon = RedHatTransformer.transformUnionableType;
    toCeylon = unionableTypeToCeylon;
    
    tests = [intersectionType, primaryType];
}
