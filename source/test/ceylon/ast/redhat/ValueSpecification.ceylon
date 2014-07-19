import ceylon.ast.core {
    LIdentifier,
    Specifier,
    ValueSpecification
}
import ceylon.ast.redhat {
    RedHatTransformer,
    valueSpecificationToCeylon,
    compileValueSpecification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSpecifierStatement=SpecifierStatement
    }
}

shared object valueSpecification satisfies ConcreteTest<ValueSpecification,JSpecifierStatement> {
    
    String->ValueSpecification construct(String->LIdentifier name, String->Specifier specifier)
            => "``name.key````specifier.key``"->ValueSpecification(name.item, specifier.item);
    
    shared String->ValueSpecification sizeSpecify0 = construct("size"->LIdentifier("size"), specifier._0Specifier);
    
    compile = compileValueSpecification;
    fromCeylon = RedHatTransformer.transformValueSpecification;
    toCeylon = valueSpecificationToCeylon;
    codes = [sizeSpecify0];
}
