import ceylon.ast.core {
    Specification
}
import ceylon.ast.redhat {
    RedHatTransformer,
    specificationToCeylon,
    compileSpecification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierStatement=SpecifierStatement
    }
}

shared object specification satisfies AbstractTest<Specification,JSpecifierStatement> {
    compile = compileSpecification;
    fromCeylon = RedHatTransformer.transformSpecification;
    toCeylon = specificationToCeylon;
    
    tests = [valueSpecification];
}
