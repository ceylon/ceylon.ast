import ceylon.ast.core {
    Identifier,
    ImportAlias,
    ImportElement,
    ImportElements
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importElementToCeylon,
    parseImportElement
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JImportMemberOrType=ImportMemberOrType
    }
}

shared object importElement satisfies ConcreteTest<ImportElement,JImportMemberOrType> {
    
    String->ImportElement construct(String->Identifier name, <String->ImportAlias>? importAlias = null, <String->ImportElements>? nestedImports = null)
            => "`` importAlias?.key else "" ````name.key```` nestedImports?.key else "" ``" -> ImportElement(name.item, importAlias?.item, nestedImports?.item);
    
    shared String->ImportElement uidImportElement = construct(identifier.uidUIdentifier);
    shared String->ImportElement lidAsUidImportElement = construct(identifier.lidUIdentifier, importAlias.uidImportAlias);
    shared String->ImportElement nestedImportElement = construct {
        identifier.uidUIdentifier;
        nestedImports = importElements.wildcardImportElements;
    };
    shared String->ImportElement noopImportElement = construct(identifier.noopLIdentifier);
    shared String->ImportElement uidAsLidImportElement = construct(identifier.uidLIdentifier, importAlias.lidImportAlias);
    
    // not tested directly, but used by other tests
    shared String->ImportElement stringAsJStringImportElement = construct(identifier.stringUIdentifier, importAlias.jstringImportAlias);
    shared String->ImportElement systemImportElement => construct { identifier.systemUIdentifier; nestedImports = importElements.outAsSysoutImportElements; };
    shared String->ImportElement arrayListElement = construct(identifier.arrayListUIdentifier);
    shared String->ImportElement mutableListElement = construct(identifier.mutableListUIdentifier);
    shared String->ImportElement outAsSysoutImportElement = construct(identifier.outLIdentifier, importAlias.sysoutImportAlias);
    
    parse = parseImportElement;
    fromCeylon = RedHatTransformer.transformImportElement;
    toCeylon = importElementToCeylon;
    codes = [uidImportElement, lidAsUidImportElement, nestedImportElement, noopImportElement, uidAsLidImportElement];
}
