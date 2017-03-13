import ceylon.ast.core {
    Artifact,
    LIdentifier,
    Module,
    ModuleImport,
    ModuleName,
    ModuleSpecifier,
    Node,
    Repository,
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
shared ModuleImport moduleImportToCeylon(JImportModule moduleImport, Anything(JNode, Node) update = noop) {
    Module onlyName;
    if (exists jName = moduleImport.importPath) {
        "Can’t have both import path and quoted literal"
        assert (!moduleImport.quotedLiteral exists);
        onlyName = fullPackageNameToCeylon(jName, update);
    } else {
        "Must have a name"
        assert (exists quotedLiteral = moduleImport.quotedLiteral);
        value nameToken = quotedLiteral.mainToken;
        value nameTokenType = nameToken.type;
        if (nameTokenType == string_literal) {
            onlyName = stringLiteralToCeylon(JStringLiteral(nameToken), update);
        } else if (nameTokenType == char_literal) {
            // Old syntax, still supported by the compiler.
            // TODO should we just throw here?
            nameToken.type = string_literal; // hack
            onlyName = stringLiteralToCeylon(JStringLiteral(nameToken), update);
        } else {
            throw AssertionError("Unknown name token type ``nameTokenType``, expected STRING_LITERAL (``string_literal``) or CHAR_LITERAL (``char_literal``)");
        }
    }
    Module|ModuleSpecifier name;
    if (is StringLiteral onlyName, !moduleImport.namespace exists && !moduleImport.artifact exists) {
        // string literal with neither repository nor artifact is just a quoted module name, not a ModuleSpecifier
        name = onlyName;
    } else if (moduleImport.namespace exists || moduleImport.artifact exists) {
        Repository repository;
        if (exists namespace = moduleImport.namespace) {
            repository = lIdentifierToCeylon(namespace, update);
        } else {
            // Old syntax: the compiler supports an implicit maven: namespace/repository, which we conjure up here.
            // TODO should we just throw here?
            repository = LIdentifier("maven");
            update(moduleImport, repository);
        }
        Artifact? artifact;
        if (exists jArtifact = moduleImport.artifact) {
            value nameToken = jArtifact.mainToken;
            assert (nameToken.type == string_literal);
            artifact = stringLiteralToCeylon(JStringLiteral(nameToken), update);
        } else {
            artifact = null;
        }
        name = ModuleSpecifier(repository, onlyName, artifact);
        update(moduleImport, name);
    } else {
        assert (is ModuleName onlyName);
        name = onlyName;
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
    value result = ModuleImport(name, version, annotationsToCeylon(moduleImport.annotationList else JAnnotationList(null), update));
    update(moduleImport, result);
    return result;
}

"Parses the given [[code]] for a Module Import
 into a [[ModuleImport]] using the Ceylon compiler
 (more specifically, the rule for an `importModuleList`)."
shared ModuleImport? parseModuleImport(String code, Anything(JNode, Node) update = noop) {
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
