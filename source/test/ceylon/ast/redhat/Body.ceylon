import ceylon.ast.core {
    Body
}
import ceylon.ast.redhat {
    RedHatTransformer,
    bodyToCeylon
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JBody=Body
    }
}

shared object body satisfies AbstractConversionTest<Body,JBody> {
    fromCeylon = RedHatTransformer.transformBody;
    toCeylon = bodyToCeylon;
    
    tests = [block, classBody, interfaceBody];
}
