import ceylon.ast.core {
    ImportElements,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JImportMemberOrTypeList=ImportMemberOrTypeList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ImportMemberOrTypeList|JImportMemberOrTypeList]] to a `ceylon.ast` [[ImportElements]]."
shared ImportElements importElementsToCeylon(JImportMemberOrTypeList importElements, Anything(JNode,Node) update = noop) {
    value result = ImportElements {
        elements = CeylonIterable(importElements.importMemberOrTypes).collect(propagateUpdate(importElementToCeylon, update));
        wildcard = importElements.importWildcard exists then importWildcardToCeylon(importElements.importWildcard, update);
    };
    update(importElements, result);
    return result;
}

"Parses the given [[code]] for an Import Elements
 into an [[ImportElements]] using the Ceylon compiler
 (more specifically, the rule for an `importElementList`)."
shared ImportElements? parseImportElements(String code, Anything(JNode,Node) update = noop) {
    if (exists jImportElementList = createParser(code).importElementList()) {
        return importElementsToCeylon(jImportElementList, update);
    } else {
        return null;
    }
}
