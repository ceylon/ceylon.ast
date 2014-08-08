import ceylon.ast.core {
    ImportElement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportMemberOrType=ImportMemberOrType
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonParser {
        uidentifier=\iUIDENTIFIER
    }
}

"Converts a RedHat AST [[ImportMemberOrType|JImportMemberOrType]] to a `ceylon.ast` [[ImportElement]]."
shared ImportElement importElementToCeylon(JImportMemberOrType importElement) {
    if (importElement.identifier.mainToken.type == uidentifier) {
        return importTypeElementToCeylon(importElement);
    } else {
        return importFunctionValueElementToCeylon(importElement);
    }
}

"Compiles the given [[code]] for an Import Element
 into an [[ImportElement]] using the Ceylon compiler
 (more specifically, the rule for an `importElement`)."
shared ImportElement? compileImportElement(String code) {
    if (exists jImportElement = createParser(code).importElement()) {
        return importElementToCeylon(jImportElement);
    } else {
        return null;
    }
}
