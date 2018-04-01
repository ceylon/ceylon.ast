import ceylon.ast.core {
    MainType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    mainTypeToCeylon,
    parseMainType
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType
    }
}

shared object mainType satisfies AbstractTest<MainType,JStaticType> {
    parse = parseMainType;
    fromCeylon = RedHatTransformer.transformMainType;
    toCeylon = mainTypeToCeylon;
    
    tests = [unionType, unionableType];
}
