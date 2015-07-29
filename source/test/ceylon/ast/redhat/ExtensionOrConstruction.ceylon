import ceylon.ast.core {
    ExtensionOrConstruction
}
import ceylon.ast.redhat {
    RedHatTransformer,
    extensionOrConstructionToCeylon,
    compileExtensionOrConstruction
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInvocationExpression=InvocationExpression,
        JSimpleType=SimpleType
    }
}

shared object extensionOrConstruction satisfies AbstractTest<ExtensionOrConstruction,JInvocationExpression|JSimpleType> {
    compile = compileExtensionOrConstruction;
    fromCeylon = RedHatTransformer.transformExtensionOrConstruction;
    toCeylon = extensionOrConstructionToCeylon;
    
    tests = [extension, construction];
}
