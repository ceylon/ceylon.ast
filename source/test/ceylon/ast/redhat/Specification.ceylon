import ceylon.ast.core {
    Specification
}
import ceylon.ast.redhat {
    RedHatTransformer,
    specificationToCeylon,
    parseSpecification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierStatement=SpecifierStatement
    }
}

shared object specification satisfies AbstractTest<Specification,JSpecifierStatement> {
    parse = parseSpecification;
    fromCeylon = RedHatTransformer.transformSpecification;
    toCeylon = specificationToCeylon;
    
    tests = [valueSpecification, lazySpecification];
}
