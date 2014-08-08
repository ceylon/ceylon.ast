import ceylon.ast.core {
    ImportTypeElement
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
shared ImportTypeElement importTypeElementToCeylon(JImportMemberOrType importTypeElement) {
    return ImportTypeElement {
        uIdentifierToCeylon(importTypeElement.identifier);
        importTypeElement.\ialias exists then typeAliasToCeylon(importTypeElement.\ialias);
        importTypeElement.importMemberOrTypeList exists then importElementsToCeylon(importTypeElement.importMemberOrTypeList);
    };
}

"Compiles the given [[code]] for an Import Type Element
 into an [[ImportTypeElement]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportTypeElement? compileImportTypeElement(String code) {
    if (exists jImportElement = createParser(code).importElement(),
        jImportElement.identifier.mainToken.type == uidentifier) {
        return importTypeElementToCeylon(jImportElement);
    } else {
        return null;
    }
}
