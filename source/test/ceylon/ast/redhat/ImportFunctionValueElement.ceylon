import ceylon.ast.core {
    ImportFunctionValueAlias,
    ImportElements,
    ImportFunctionValueElement,
    LIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importFunctionValueElementToCeylon,
    parseImportFunctionValueElement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportMemberOrType=ImportMemberOrType
    }
}

shared object importFunctionValueElement satisfies ConcreteTest<ImportFunctionValueElement,JImportMemberOrType> {
    
    String->ImportFunctionValueElement construct(String->LIdentifier name, <String->ImportFunctionValueAlias>? importAlias = null, <String->ImportElements>? nestedImports = null)
            => "`` importAlias?.key else "" ````name.key```` nestedImports?.key else "" ``"->ImportFunctionValueElement(name.item, importAlias?.item, nestedImports?.item);
    
    shared String->ImportFunctionValueElement noopImportElement = construct(identifier.noopLIdentifier);
    shared String->ImportFunctionValueElement uidAsLidImportElement = construct(identifier.uidLIdentifier, importFunctionValueAlias.lidImportFunctionValueAlias);
    
    // not tested directly, but used by other tests
    shared String->ImportFunctionValueElement outAsSysoutImportElement = construct(identifier.outLIdentifier, importFunctionValueAlias.sysoutImportFunctionValueAlias);
    
    parse = parseImportFunctionValueElement;
    fromCeylon = RedHatTransformer.transformImportFunctionValueElement;
    toCeylon = importFunctionValueElementToCeylon;
    codes = [noopImportElement, uidAsLidImportElement];
}
