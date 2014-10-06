import ceylon.ast.core {
    Identifier,
    LIdentifier,
    UIdentifier,
    uidentifierNeedsPrefix,
    lidentifierNeedsPrefix
}

"Something that can readily be converted to an [[Identifier]]
 using the [[identifier]] utility function."
shared alias IdentifierIsh => Identifier|String;

"""Parses an identifier from its text. The text may contain the prefix, but no escape sequences.
   
   Examples:
   
       identifier("name")
       identifier("S_``state``")"""
shared Identifier identifier(IdentifierIsh text) {
    switch (text)
    case (is String) {
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
    case (is Identifier) { return text; }
}

"""Utility function to create an [[LIdentifier]],
   [[with prefix|LIdentifier.usePrefix]] if and only if necessary.
   
   Examples:
   
       lidentifier("null")
       lidentifier(attributeName)"""
throws (`class AssertionError`, "If [[name]] is a [[UIdentifier]].")
shared LIdentifier lidentifier(IdentifierIsh name) {
    switch (name)
    case (is String) { return LIdentifier(name, lidentifierNeedsPrefix(name)); }
    case (is Identifier) {
        "Cannot convert UIdentifier to LIdentifier"
        assert (is LIdentifier name);
        return name;
    }
}

"""Utility function to create an [[UIdentifier]],
   [[with prefix|UIdentifier.usePrefix]] if and only if necessary.
   
   Examples:
   
       uidentifier("Anything")
       uidentifier(className)"""
throws (`class AssertionError`, "If [[name]] is an [[LIdentifier]].")
shared UIdentifier uidentifier(IdentifierIsh name) {
    switch (name)
    case (is String) { return UIdentifier(name, uidentifierNeedsPrefix(name)); }
    case (is Identifier) {
        "Cannot convert LIdentifier to UIdentifier"
        assert (is UIdentifier name);
        return name;
    }
}
