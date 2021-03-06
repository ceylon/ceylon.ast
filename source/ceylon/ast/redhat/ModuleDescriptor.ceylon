import ceylon.ast.core {
    Artifact,
    Classifier,
    Module,
    ModuleDescriptor,
    ModuleSpecifier,
    Node,
    Repository,
    StringLiteral
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JModuleDescriptor=ModuleDescriptor,
        JStringLiteral=StringLiteral
    }
}
import org.eclipse.ceylon.compiler.typechecker.parser {
    CeylonParser {
        char_literal=\iCHAR_LITERAL,
        string_literal=\iSTRING_LITERAL
    }
}

"Converts a RedHat AST [[ModuleDescriptor|JModuleDescriptor]] to a `ceylon.ast` [[ModuleDescriptor]]."
shared ModuleDescriptor moduleDescriptorToCeylon(JModuleDescriptor moduleDescriptor, Anything(JNode, Node) update = noop) {
    StringLiteral version;
    value jVersion = moduleDescriptor.version;
    value token = jVersion.token;
    value type = token.type;
    if (type == string_literal) {
        version = stringLiteralToCeylon(JStringLiteral(token), update);
    } else if (type == char_literal) {
        // Old syntax, still supported by the compiler.
        // TODO should we just throw here?
        token.type = string_literal; // hack
        version = stringLiteralToCeylon(JStringLiteral(token), update);
    } else {
        throw AssertionError("Unknown version token type ``type``, expected STRING_LITERAL (``string_literal``) or CHAR_LITERAL (``char_literal``)");
    }
    ModuleSpecifier? specifier;
    if (exists jRepository = moduleDescriptor.namespace) {
        Repository repository = lIdentifierToCeylon(jRepository, update);
        Module moduleName;
        if (exists jGroupImportPath = moduleDescriptor.groupImportPath) {
            "Module descriptor cannot have both group import path and group quoted literal"
            assert (!moduleDescriptor.groupQuotedLiteral exists);
            moduleName = fullPackageNameToCeylon(jGroupImportPath, update);
        } else {
            "Module descriptor must have group import path or group quoted literal"
            assert (exists jGroupQuotedLiteral = moduleDescriptor.groupQuotedLiteral);
            moduleName = stringLiteralToCeylon(JStringLiteral(jGroupQuotedLiteral.token), update);
        }
        Artifact? artifact;
        if (exists jArtifact = moduleDescriptor.artifact) {
            artifact = stringLiteralToCeylon(JStringLiteral(jArtifact.token), update);
        } else {
            artifact = null;
        }
        Classifier? classifier;
        if (exists jClassifier = moduleDescriptor.classifier) {
            classifier = stringLiteralToCeylon(JStringLiteral(jClassifier.token), update);
        } else {
            classifier = null;
        }
        specifier = ModuleSpecifier(repository, moduleName, artifact, classifier);
        assert (exists specifier); // ceylon/ceylon#3642
        update(moduleDescriptor, specifier);
    } else {
        specifier = null;
    }
    value result = ModuleDescriptor(fullPackageNameToCeylon(moduleDescriptor.importPath, update), version, moduleBodyToCeylon(moduleDescriptor.importModuleList, update), annotationsToCeylon(moduleDescriptor.annotationList, update), specifier);
    update(moduleDescriptor, result);
    return result;
}

"Parses the given [[code]] for a Module Descriptor
 into a [[ModuleDescriptor]] using the Ceylon compiler
 (more specifically, the rule for a `moduleDescriptor`)."
shared ModuleDescriptor? parseModuleDescriptor(String code, Anything(JNode, Node) update = noop) {
    if (exists jModuleDescriptor = createParser(code).moduleDescriptor()) {
        return moduleDescriptorToCeylon(jModuleDescriptor, update);
    } else {
        return null;
    }
}
