import ceylon.ast.core {
    FullPackageName,
    PackageDec
}
import ceylon.ast.redhat {
    RedHatTransformer,
    packageDecToCeylon,
    compilePackageDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPackageLiteral=PackageLiteral
    }
}

shared object packageDec satisfies ConcreteTest<PackageDec,JPackageLiteral> {
    
    String->PackageDec construct(String->FullPackageName packageName)
            => "`package ``packageName.key```"->PackageDec(packageName.item);
    
    shared String->PackageDec ceylonAstCorePackageDec = construct(fullPackageName.ceylonAstCorePackageName);
    
    compile = compilePackageDec;
    fromCeylon = RedHatTransformer.transformPackageDec;
    toCeylon = packageDecToCeylon;
    codes = [ceylonAstCorePackageDec];
}
