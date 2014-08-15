import ceylon.ast.core {
    TypeSpecifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeSpecifier=TypeSpecifier
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        compute=\iCOMPUTE
    }
}

"Converts a RedHat AST [[TypeSpecifier|JTypeSpecifier]] to a `ceylon.ast` [[TypeSpecifier]]."
shared TypeSpecifier typeSpecifierToCeylon(JTypeSpecifier typeSpecifier) {
    "Must be specified with computation operator"
    assert (typeSpecifier.mainToken.type == compute);
    return TypeSpecifier(typeToCeylon(typeSpecifier.type));
}

"Compiles the given [[code]] for a Type Specifier
 into a [[TypeSpecifier]] using the Ceylon compiler
 (more specifically, the rule for a `typeSpecifier`)."
shared TypeSpecifier? compileTypeSpecifier(String code) {
    if (exists jTypeSpecifier = createParser(code).typeSpecifier(),
        // the parser also allows type specifiers with a specification operator `=`, check for that
        jTypeSpecifier.mainToken.type == compute) {
        return typeSpecifierToCeylon(jTypeSpecifier);
    } else {
        return null;
    }
}
