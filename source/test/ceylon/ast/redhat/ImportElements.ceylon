import ceylon.ast.core {
    ImportElement,
    ImportElements,
    ImportWildcard
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importElementsToCeylon,
    compileImportElements
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportMemberOrTypeList=ImportMemberOrTypeList
    }
}

shared object importElements satisfies ConcreteTest<ImportElements,JImportMemberOrTypeList> {
    
    String->ImportElements construct(<String->ImportElement>[] elements = [], <String->ImportWildcard>? wildcard = null)
            => "{``",\n".join(concatenate(elements*.key, emptyOrSingleton(wildcard?.key)))``}"->ImportElements(elements*.item, wildcard?.item);
    
    // these need to be lazy to avoid cyclic initialization
    shared String->ImportElements wildcardImportElements => construct { wildcard = importWildcard.importWildcard; };
    shared String->ImportElements someImportElements => construct([
            importTypeElement.nestedImportElement,
            importTypeElement.lidAsUidImportElement,
            importFunctionValueElement.noopImportElement,
            importFunctionValueElement.uidAsLidImportElement
        ]);
    
    compile = compileImportElements;
    fromCeylon = RedHatTransformer.transformImportElements;
    toCeylon = importElementsToCeylon;
    codes => [wildcardImportElements, someImportElements]; // again, lazy
}
