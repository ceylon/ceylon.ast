import ceylon.ast.core {
    ImportTypeElement,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JImportMemberOrType=ImportMemberOrType
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonParser {
        uidentifier=UIDENTIFIER
    }
}

"Converts a RedHat AST [[ImportMemberOrType|JImportMemberOrType]] to a `ceylon.ast` [[ImportTypeElement]].
 
 (It might seem more appropriate if this method only accepted [[ImportType|com.redhat.ceylon.compiler.typechecker.tree::Tree.ImportType]]s,
 but the RedHat parser never actually produces these. See [ceylon/ceylon-spec#323](https://github.com/ceylon/ceylon-spec/issues/323).)"
shared ImportTypeElement importTypeElementToCeylon(JImportMemberOrType importTypeElement, Anything(JNode,Node) update = noop) {
    value result = ImportTypeElement {
        uIdentifierToCeylon(importTypeElement.identifier, update);
        importTypeElement.\ialias exists then importTypeAliasToCeylon(importTypeElement.\ialias, update);
        importTypeElement.importMemberOrTypeList exists then importElementsToCeylon(importTypeElement.importMemberOrTypeList, update);
    };
    update(importTypeElement, result);
    return result;
}

"Compiles the given [[code]] for an Import Type Element
 into an [[ImportTypeElement]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportTypeElement? compileImportTypeElement(String code, Anything(JNode,Node) update = noop) {
    if (exists jImportElement = createParser(code).importElement(),
        jImportElement.identifier.mainToken.type == uidentifier) {
        return importTypeElementToCeylon(jImportElement, update);
    } else {
        return null;
    }
}
