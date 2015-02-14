import ceylon.ast.core {
    LIdentifier,
    Specifier,
    This,
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
    
    String->ValueSpecification construct(String->LIdentifier name, String->Specifier specifier, <String->This>? qualifier = null)
            => "``(if (exists qualifier) then "``qualifier.key``." else "")````name.key````specifier.key``"->ValueSpecification(name.item, specifier.item, qualifier?.item);
    
    shared String->ValueSpecification sizeSpecify0 = construct("size"->LIdentifier("size"), specifier._0Specifier);
    shared String->ValueSpecification thisSizeSpecify0 = construct("size"->LIdentifier("size"), specifier._0Specifier, "this"->This());
    
    compile = compileValueSpecification;
    fromCeylon = RedHatTransformer.transformValueSpecification;
    toCeylon = valueSpecificationToCeylon;
    codes = [sizeSpecify0, thisSizeSpecify0];
}
