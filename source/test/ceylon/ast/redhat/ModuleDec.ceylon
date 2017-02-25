import ceylon.ast.core {
    FullPackageName,
    ModuleDec
}
import ceylon.ast.redhat {
    RedHatTransformer,
    moduleDecToCeylon,
    parseModuleDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JModuleLiteral=ModuleLiteral
    }
}

shared object moduleDec satisfies ConcreteTest<ModuleDec,JModuleLiteral> {
    
    String->ModuleDec construct(<String->FullPackageName>? moduleName)
            => "`module `` moduleName?.key else "" ```" -> ModuleDec(moduleName?.item);
    
    shared String->ModuleDec ceylonAstCoreModuleDec = construct(fullPackageName.ceylonAstCorePackageName);
    shared String->ModuleDec currentModuleDec = construct(null);
    
    parse = parseModuleDec;
    fromCeylon = RedHatTransformer.transformModuleDec;
    toCeylon = moduleDecToCeylon;
    codes = [ceylonAstCoreModuleDec, currentModuleDec];
}
