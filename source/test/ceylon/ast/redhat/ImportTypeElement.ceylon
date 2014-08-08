import ceylon.ast.core {
    ImportElements,
    ImportTypeElement,
    TypeAlias,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importTypeElementToCeylon,
    compileImportTypeElement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportMemberOrType=ImportMemberOrType
    }
}

shared object importTypeElement satisfies ConcreteTest<ImportTypeElement,JImportMemberOrType> {
    
    String->ImportTypeElement construct(String->UIdentifier name, <String->TypeAlias>? importAlias = null, <String->ImportElements>? nestedImports = null)
            => "`` importAlias?.key else "" ````name.key```` nestedImports?.key else "" ``"->ImportTypeElement(name.item, importAlias?.item, nestedImports?.item);
    
    shared String->ImportTypeElement uidImportElement = construct(identifier.uidUIdentifier);
    shared String->ImportTypeElement lidAsUidImportElement = construct(identifier.lidUIdentifier, typeAlias.uidTypeAlias);
    shared String->ImportTypeElement nestedImportElement = construct {
        identifier.uidUIdentifier;
        nestedImports = importElements.wildcardImportElements;
    };
    
    compile = compileImportTypeElement;
    fromCeylon = RedHatTransformer.transformImportTypeElement;
    toCeylon = importTypeElementToCeylon;
    codes = [uidImportElement, lidAsUidImportElement];
}
