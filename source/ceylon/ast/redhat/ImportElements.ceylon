import ceylon.ast.core {
    ImportElements
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportMemberOrTypeList=ImportMemberOrTypeList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ImportMemberOrTypeList|JImportMemberOrTypeList]] to a `ceylon.ast` [[ImportElements]]."
shared ImportElements importElementsToCeylon(JImportMemberOrTypeList importElements) {
    return ImportElements {
        elements = CeylonIterable(importElements.importMemberOrTypes).collect(importElementToCeylon);
        wildcard = importElements.importWildcard exists then importWildcardToCeylon(importElements.importWildcard);
    };
}

"Compiles the given [[code]] for an Import Elements
 into an [[ImportElements]] using the Ceylon compiler
 (more specifically, the rule for an `importElementList`)."
shared ImportElements? compileImportElements(String code) {
    if (exists jImportElementList = createParser(code).importElementList()) {
        return importElementsToCeylon(jImportElementList);
    } else {
        return null;
    }
}
