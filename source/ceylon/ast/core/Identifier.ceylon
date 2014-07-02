String[] keywords = [
    "assembly", "module", "package", "import",
    "alias", "class", "interface", "object", "given", "value", "assign", "void", "function", "new",
    "of", "extends", "satisfies", "abstracts",
    "in", "out",
    "return", "break", "continue", "throw",
    "assert", "dynamic",
    "if", "else", "switch", "case", "for", "while", "try", "catch", "finally", "then", "let",
    "this", "outer", "super",
    "is", "exists", "nonempty"
];

shared alias TypeName => UIdentifier;
shared alias MemberName => LIdentifier;
shared alias PackageName => LIdentifier;

shared abstract class Identifier(name, enforcePrefix) of LIdentifier | UIdentifier extends ExpressionIsh() {
    
    "The name of the identifier."
    shared default String name;
    
    """If [[true]], enforce the `\i`/`\I` prefix.
       
       This property is only of concern to tools which deal immediately with source code;
       it does not influence the equality of `Identifier` instances."""
    shared default Boolean enforcePrefix;
    """Whether this identifier has a `\i`/`\I` prefix in code.
       The identifier has this prefix if it is [[enforced|enforcePrefix]]
       or if it is necessary because the text’s case doesn’t match
       that of the identifier, or because it’s a keyword (e. g. `\ithis`)."""
    shared formal Boolean usePrefix;
    "The prefix for this kind of identifier – `\\i` for a [[lowercase identifier|LIdentifier]],
     `\\I` for an [[uppercase identifier|UIdentifier]]."
    shared formal String prefix;
    
    shared actual [] children = [];
    
    "The text of the identifier, that is its [[name]] and, if [[used|usePrefix]], the prefix."
    shared String text => usePrefix then prefix + name else name;
    
    shared actual Integer hash
            => name.hash;
    
    "Creates a copy of this identifier.
     All parameters default to the value of the corresponding parameter of this instance."
    shared formal Identifier copy(String name = this.name, Boolean enforcePrefix = this.enforcePrefix);
}

"An initial lowercase identifier."
shared class LIdentifier(String name, Boolean enforcePrefix = false) extends Identifier(name, enforcePrefix) {
    
    "Name must not be empty"
    assert (exists first = name.first);
    "First character of name must be a letter or an underscore ('_')"
    assert (first.letter || first == '_');
    "Name may only contain letters, digits and underscores"
    assert (name.every((Character c) => c.letter || c.digit || c == '_'));
    
    usePrefix
            = enforcePrefix || first.uppercase || name in keywords;
    prefix = "\\i";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLIdentifier(this);
    
    shared actual Boolean equals(Object other) {
        if (is LIdentifier other) {
            return name == other.name;
        } else {
            return false;
        }
    }
    
    shared actual LIdentifier copy(String name, Boolean enforcePrefix) {
        value ret = LIdentifier(name, enforcePrefix);
        ret.extraInfo = extraInfo;
        return ret;
    }
}

"An initial uppercase identifier."
shared class UIdentifier(String name, Boolean enforcePrefix = false) extends Identifier(name, enforcePrefix) {
    
    "Name must not be empty"
    assert (exists first = name.first);
    "First character of name must be a letter or an underscore ('_')"
    assert (first.letter || first == '_');
    "Name may only contain letters, digits and underscores"
    assert (name.every((Character c) => c.letter || c.digit || c == '_'));
    
    usePrefix
            = enforcePrefix || first.lowercase || first == '_' /* || name in keywords */; // there are no uppercase keywords
    prefix = "\\I";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformUIdentifier(this);
    
    shared actual Boolean equals(Object other) {
        if (is UIdentifier other) {
            return name == other.name;
        } else {
            return false;
        }
    }
    
    shared actual UIdentifier copy(String name, Boolean enforcePrefix) {
        value ret = UIdentifier(name, enforcePrefix);
        ret.extraInfo = extraInfo;
        return ret;
    }
}

"Parses an identifier from its text. The text may contain the prefix, but no escape sequences."
shared Identifier identifier(String text) {
    "Text must not be empty"
    assert (exists first = text.first);
    if (first == '\\') {
        if (text.startsWith("\\i")) {
            return LIdentifier(text[2...], true);
        } else if (text.startsWith("\\I")) {
            return UIdentifier(text[2...], true);
        } else {
            throw AssertionError("Identifier text can’t contain escape sequences");
        }
    } else {
        if (first.lowercase || first == '_') {
            return LIdentifier(text);
        } else {
            return UIdentifier(text);
        }
    }
}
