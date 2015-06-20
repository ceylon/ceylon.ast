import ceylon.ast.core {
    Node,
    SelfReference,
    This,
    Super,
    Outer,
    Package
}
import ceylon.ast.redhat {
    RedHatTransformer,
    compileSelfReference,
    compileThis,
    compileSuper,
    compileOuter,
    compilePackage,
    selfReferenceToCeylon,
    thisToCeylon,
    superToCeylon,
    outerToCeylon,
    packageToCeylon
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSelfExpression=SelfExpression,
        JThis=This,
        JSuper=Super,
        JOuter=Outer,
        JPackage=Package
    }
}

shared object \ithis satisfies ConcreteTest<This,JThis> {
    shared String->This thisThis = "this"->This();
    compile = compileThis;
    fromCeylon = RedHatTransformer.transformThis;
    toCeylon = thisToCeylon;
    codes = [thisThis];
}
shared object \isuper satisfies ConcreteTest<Super,JSuper> {
    shared String->Super superSuper = "super"->Super();
    compile = compileSuper;
    fromCeylon = RedHatTransformer.transformSuper;
    toCeylon = superToCeylon;
    codes = [superSuper];
}
shared object \iouter satisfies ConcreteTest<Outer,JOuter> {
    shared String->Outer outerOuter = "outer"->Outer();
    compile = compileOuter;
    fromCeylon = RedHatTransformer.transformOuter;
    toCeylon = outerToCeylon;
    codes = [outerOuter];
}
shared object \ipackage satisfies ConcreteTest<Package,JPackage> {
    shared String->Package packagePackage = "package"->Package();
    compile = compilePackage;
    fromCeylon = RedHatTransformer.transformPackage;
    toCeylon = packageToCeylon;
    codes = [packagePackage];
}

shared object selfReference satisfies AbstractTest<SelfReference,JNode/*JSelfExpression|JOuter|JPackage*/> {
    compile = compileSelfReference;
    fromCeylon = RedHatTransformer.transformSelfReference;
    //toCeylon = selfReferenceToCeylon;
    shared actual SelfReference toCeylon(JNode jNode, Anything(JNode,Node) update) {
        assert (is JSelfExpression|JOuter|JPackage jNode);
        return selfReferenceToCeylon(jNode, update);
    }
    
    tests = [\ithis, \isuper, \iouter, \ipackage];
}
