import ceylon.ast.core {
    FunctionValueAlias,
    ImportElements,
    ImportFunctionValueElement,
    LIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importFunctionValueElementToCeylon,
    compileImportFunctionValueElement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportMemberOrType=ImportMemberOrType
    }
}

shared object importFunctionValueElement satisfies ConcreteTest<ImportFunctionValueElement,JImportMemberOrType> {
    
    String->ImportFunctionValueElement construct(String->LIdentifier name, <String->FunctionValueAlias>? importAlias = null, <String->ImportElements>? nestedImports = null)
            => "`` importAlias?.key else "" ````name.key```` nestedImports?.key else "" ``"->ImportFunctionValueElement(name.item, importAlias?.item, nestedImports?.item);
    
    shared String->ImportFunctionValueElement noopImportElement = construct(identifier.noopLIdentifier);
    shared String->ImportFunctionValueElement uidAsLidImportElement = construct(identifier.uidLIdentifier, functionValueAlias.lidFunctionValueAlias);
    
    compile = compileImportFunctionValueElement;
    fromCeylon = RedHatTransformer.transformImportFunctionValueElement;
    toCeylon = importFunctionValueElementToCeylon;
    codes = [noopImportElement, uidAsLidImportElement];
}
