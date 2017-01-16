import ceylon.ast.core {
    FullPackageName,
    ModuleImport,
    Node,
    RepositoryType,
    StringLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared ModuleImport moduleImportToCeylon(JImportModule moduleImport, Anything(JNode,Node) update = noop) {
    FullPackageName|StringLiteral name;
    if (exists jName = moduleImport.importPath) {
        "Can’t have both import path and quoted literal"
        assert (!moduleImport.quotedLiteral exists);
        name = fullPackageNameToCeylon(jName, update);
    } else {
        "Must have a name"
        assert (exists quotedLiteral = moduleImport.quotedLiteral);
        value nameToken = quotedLiteral.mainToken;
        value nameTokenType = nameToken.type;
        if (nameTokenType == string_literal) {
            name = stringLiteralToCeylon(JStringLiteral(nameToken), update);
        } else if (nameTokenType == char_literal) {
            // Old syntax, still supported by the compiler.
            // TODO should we just throw here?
            nameToken.type = string_literal; // hack
            name = stringLiteralToCeylon(JStringLiteral(nameToken), update);
        } else {
            throw AssertionError("Unknown name token type ``nameTokenType``, expected STRING_LITERAL (``string_literal``) or CHAR_LITERAL (``char_literal``)");
        }
    }
    StringLiteral version;
    value versionToken = moduleImport.version.mainToken;
    value versionTokenType = versionToken.type;
    if (versionTokenType == string_literal) {
        version = stringLiteralToCeylon(JStringLiteral(versionToken), update);
    } else if (versionTokenType == char_literal) {
        // TODO again, should we really accept this?
        versionToken.type = string_literal;
        version = stringLiteralToCeylon(JStringLiteral(versionToken), update);
    } else {
        throw AssertionError("Unknown version token type ``versionTokenType``, expected STRING_LITERAL (``string_literal``) or CHAR_LITERAL (``char_literal``)");
    }
    RepositoryType? repositoryType;
    if (exists namespace = moduleImport.namespace) {
        repositoryType = lIdentifierToCeylon(namespace, update);
    } else {
        repositoryType = null;
    }
    value result = ModuleImport(name, version, annotationsToCeylon(moduleImport.annotationList else JAnnotationList(null), update), repositoryType);
    update(moduleImport, result);
    return result;
}

"Parses the given [[code]] for a Module Import
 into a [[ModuleImport]] using the Ceylon compiler
 (more specifically, the rule for an `importModuleList`)."
shared ModuleImport? parseModuleImport(String code, Anything(JNode,Node) update = noop) {
    /*
     The `importModule` rule doesn’t take annotations,
     so we have to construct a fake importModuleList
     */
    if (exists jImportModuleList = createParser("{" + code + "}").importModuleList(),
        jImportModuleList.importModules.size() == 1) {
        return moduleImportToCeylon(jImportModuleList.importModules.get(0), update);
    } else {
        return null;
    }
}
