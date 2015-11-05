import ceylon.ast.core {
    MainType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    mainTypeToCeylon,
    compileMainType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType
    }
}

shared object mainType satisfies AbstractTest<MainType,JStaticType> {
    compile = compileMainType;
    fromCeylon = RedHatTransformer.transformMainType;
    toCeylon = mainTypeToCeylon;
    
    tests = [unionType, unionableType];
}
