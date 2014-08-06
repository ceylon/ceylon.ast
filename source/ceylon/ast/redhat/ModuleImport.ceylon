import ceylon.ast.core {
    FullPackageName,
    ModuleImport,
    StringLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnnotationList=AnnotationList,
        JImportModule=ImportModule,
        JStringLiteral=StringLiteral
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonParser {
        char_literal=\iCHAR_LITERAL,
        string_literal=\iSTRING_LITERAL
    }
}

"Converts a RedHat AST [[ImportModule|JImportModule]] to a `ceylon.ast` [[ModuleImport]]."
shared ModuleImport moduleImportToCeylon(JImportModule moduleImport) {
    FullPackageName|StringLiteral name;
    if (exists jName = moduleImport.importPath) {
        "Can’t have both import path and quoted literal"
        assert (!moduleImport.quotedLiteral exists);
        name = fullPackageNameToCeylon(jName);
    } else {
        "Must have a name"
        assert (exists quotedLiteral = moduleImport.quotedLiteral);
        value token = quotedLiteral.mainToken;
        value type = token.type;
        if (type == string_literal) {
            name = stringLiteralToCeylon(JStringLiteral(token));
        } else if (type == char_literal) {
            // Old syntax, still supported by the compiler.
            // TODO should we just throw here?
            token.type = string_literal; // hack
            name = stringLiteralToCeylon(JStringLiteral(token));
        } else {
            throw AssertionError("Unknown name token type ``type``, expected STRING_LITERAL (``string_literal``) or CHAR_LITERAL (``char_literal``)");
        }
    }
    StringLiteral version;
    value token = moduleImport.version.mainToken;
    value type = token.type;
    if (type == string_literal) {
        version = stringLiteralToCeylon(JStringLiteral(token));
    } else if (type == char_literal) {
        // TODO again, should we really accept this?
        token.type = string_literal;
        version = stringLiteralToCeylon(JStringLiteral(token));
    } else {
        throw AssertionError("Unknown version token type ``type``, expected STRING_LITERAL (``string_literal``) or CHAR_LITERAL (``char_literal``)");
    }
    return ModuleImport(name, version, annotationsToCeylon(moduleImport.annotationList else JAnnotationList(null)));
}

"Compiles the given [[code]] for a Module Import
 into a [[ModuleImport]] using the Ceylon compiler
 (more specifically, the rule for an `importModuleList`)."
shared ModuleImport? compileModuleImport(String code) {
    /*
     The `importModule` rule doesn’t take annotations,
     so we have to construct a fake importModuleList
     */
    if (exists jImportModuleList = createParser("{" + code + "}").importModuleList(),
        jImportModuleList.importModules.size() == 1) {
        return moduleImportToCeylon(jImportModuleList.importModules.get(0));
    } else {
        return null;
    }
}
