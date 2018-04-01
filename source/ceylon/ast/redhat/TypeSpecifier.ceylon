import ceylon.ast.core {
    Node,
    TypeSpecifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTypeSpecifier=TypeSpecifier
    }
}
import org.eclipse.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        compute=\iCOMPUTE
    }
}

"Converts a RedHat AST [[TypeSpecifier|JTypeSpecifier]] to a `ceylon.ast` [[TypeSpecifier]]."
shared TypeSpecifier typeSpecifierToCeylon(JTypeSpecifier typeSpecifier, Anything(JNode, Node) update = noop) {
    "Must be specified with computation operator"
    assert (typeSpecifier.mainToken.type == compute);
    value result = TypeSpecifier(typeToCeylon(typeSpecifier.type, update));
    update(typeSpecifier, result);
    return result;
}

"Parses the given [[code]] for a Type Specifier
 into a [[TypeSpecifier]] using the Ceylon compiler
 (more specifically, the rule for a `typeSpecifier`)."
shared TypeSpecifier? parseTypeSpecifier(String code, Anything(JNode, Node) update = noop) {
    if (exists jTypeSpecifier = createParser(code).typeSpecifier(),
        // the parser also allows type specifiers with a specification operator `=`, check for that
        jTypeSpecifier.mainToken.type == compute) {
        return typeSpecifierToCeylon(jTypeSpecifier, update);
    } else {
        return null;
    }
}
