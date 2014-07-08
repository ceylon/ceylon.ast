import ceylon.ast.core {
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
    compile(String code) => compileThis(code);
    shared actual JThis fromCeylon(RedHatTransformer transformer)(This node) => transformer.transformThis(node);
    shared actual This toCeylon(JThis node) => thisToCeylon(node);
    codes = [thisThis];
}
shared object \isuper satisfies ConcreteTest<Super,JSuper> {
    shared String->Super superSuper = "super"->Super();
    compile(String code) => compileSuper(code);
    shared actual JSuper fromCeylon(RedHatTransformer transformer)(Super node) => transformer.transformSuper(node);
    shared actual Super toCeylon(JSuper node) => superToCeylon(node);
    codes = [superSuper];
}
shared object \iouter satisfies ConcreteTest<Outer,JOuter> {
    shared String->Outer outerOuter = "outer"->Outer();
    compile(String code) => compileOuter(code);
    shared actual JOuter fromCeylon(RedHatTransformer transformer)(Outer node) => transformer.transformOuter(node);
    shared actual Outer toCeylon(JOuter node) => outerToCeylon(node);
    codes = [outerOuter];
}
shared object \i_package satisfies ConcreteTest<Package,JPackage> { // TODO should be called \ipackage
    shared String->Package packagePackage = "package"->Package();
    compile(String code) => compilePackage(code);
    shared actual JPackage fromCeylon(RedHatTransformer transformer)(Package node) => transformer.transformPackage(node);
    shared actual Package toCeylon(JPackage node) => packageToCeylon(node);
    codes = [packagePackage];
}

shared object selfReference satisfies AbstractTest<SelfReference,JSelfExpression|JOuter|JPackage> {
    shared actual SelfReference? compile(String code) => compileSelfReference(code);
    shared actual JSelfExpression|JOuter|JPackage fromCeylon(RedHatTransformer transformer)(SelfReference node) => transformer.transformSelfReference(node);
    shared actual SelfReference toCeylon(JSelfExpression|JOuter|JPackage node) => selfReferenceToCeylon(node);
    
    tests = [\ithis, \isuper, \iouter, \i_package];
}
