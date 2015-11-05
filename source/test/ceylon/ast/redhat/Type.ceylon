import ceylon.ast.core {
    Type
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeToCeylon,
    compileType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType
    }
}

shared object type satisfies AbstractTest<Type,JStaticType> {
    compile = compileType;
    fromCeylon = RedHatTransformer.transformType;
    toCeylon = typeToCeylon;
    
    tests = [entryType, mainType];
}
