import ceylon.ast.core {
    FullPackageName,
    PackageName
}
import ceylon.ast.redhat {
    RedHatTransformer,
    fullPackageNameToCeylon,
    parseFullPackageName
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportPath=ImportPath
    }
}

shared object fullPackageName satisfies ConcreteTest<FullPackageName,JImportPath> {
    
    String->FullPackageName construct(<String->PackageName>+ components)
            => ".".join(components*.key) -> FullPackageName(components*.item);
    
    shared String->FullPackageName ceylonAstCorePackageName = construct(identifier.ceylonLIdentifier, identifier.astLIdentifier, identifier.coreLIdentifier);
    
    // not tested directly, but used by other tests
    shared String->FullPackageName javaLangPackageName = construct(identifier.javaLIdentifier, identifier.langLIdentifier);
    shared String->FullPackageName ceylonCollectionPackageName = construct(identifier.ceylonLIdentifier, identifier.collectionLIdentifier);
    shared String->FullPackageName orgHibernatePackageName = construct(identifier.orgLIdentifier, identifier.hibernateLIdentifier);
    shared String->FullPackageName orgHibernateCorePackageName = construct(identifier.orgLIdentifier, identifier.hibernateLIdentifier, identifier.coreLIdentifier);
    
    parse = parseFullPackageName;
    fromCeylon = RedHatTransformer.transformFullPackageName;
    toCeylon = fullPackageNameToCeylon;
    codes = [ceylonAstCorePackageName];
}
