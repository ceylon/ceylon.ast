import ceylon.ast.core {
    FullPackageName,
    PackageDec
}
import ceylon.ast.redhat {
    RedHatTransformer,
    packageDecToCeylon,
    parsePackageDec
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JPackageLiteral=PackageLiteral
    }
}

shared object packageDec satisfies ConcreteTest<PackageDec,JPackageLiteral> {
    
    String->PackageDec construct(<String->FullPackageName>? packageName)
            => "`package `` packageName?.key else "" ```" -> PackageDec(packageName?.item);
    
    shared String->PackageDec ceylonAstCorePackageDec = construct(fullPackageName.ceylonAstCorePackageName);
    shared String->PackageDec currentPackageDec = construct(null);
    
    parse = parsePackageDec;
    fromCeylon = RedHatTransformer.transformPackageDec;
    toCeylon = packageDecToCeylon;
    codes = [ceylonAstCorePackageDec, currentPackageDec];
}
