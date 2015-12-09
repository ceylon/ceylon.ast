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
            => "``(if (exists qualifier) then "``qualifier.key``." else "")````name.key````specifier.key``;"->ValueSpecification(name.item, specifier.item, qualifier?.item);
    
    // helper
    String->This thisQualifier = "this"->This();
    
    shared String->ValueSpecification sizeSpecify0 = construct("size"->LIdentifier("size"), specifier._0Specifier);
    shared String->ValueSpecification thisSizeSpecify0 = construct("size"->LIdentifier("size"), specifier._0Specifier, thisQualifier);
    
    // not tested directly, but used in other tests
    shared String->ValueSpecification thisXSpecifyX = construct(identifier.xLIdentifier, specifier.xSpecifier, thisQualifier);
    shared String->ValueSpecification thisYSpecifyY = construct(identifier.yLIdentifier, specifier.ySpecifier, thisQualifier);
    shared String->ValueSpecification thisRSpecifySqrt = construct(identifier.rLIdentifier, specifier.sqrtSpecifier, thisQualifier);
    shared String->ValueSpecification thisPhiSpecifyAtan2 = construct(identifier.phiLIdentifier, specifier.atan2Specifier, thisQualifier);
    shared String->ValueSpecification thisXSpecifyProduct = construct(identifier.xLIdentifier, specifier.rTimesCosSpecifier, thisQualifier);
    shared String->ValueSpecification thisYSpecifyProduct = construct(identifier.yLIdentifier, specifier.rTimesSinSpecifier, thisQualifier);
    shared String->ValueSpecification thisRSpecifyR = construct(identifier.rLIdentifier, specifier.rSpecifier, thisQualifier);
    shared String->ValueSpecification thisPhiSpecifyPhi = construct(identifier.phiLIdentifier, specifier.phiSpecifier, thisQualifier);
    shared String->ValueSpecification xSpecify0 = construct(identifier.xLIdentifier, specifier._0Specifier);
    shared String->ValueSpecification ySpecify0 = construct(identifier.yLIdentifier, specifier._0Specifier);
    shared String->ValueSpecification rSpecify0 = construct(identifier.rLIdentifier, specifier._0Specifier);
    shared String->ValueSpecification phiSpecify0 = construct(identifier.phiLIdentifier, specifier._0Specifier);
    
    compile = compileValueSpecification;
    fromCeylon = RedHatTransformer.transformValueSpecification;
    toCeylon = valueSpecificationToCeylon;
    codes = [sizeSpecify0, thisSizeSpecify0];
}
