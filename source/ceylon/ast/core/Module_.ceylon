"A module name for a foreign module repository system,
 which may be specified as a string literal
 if the foreign system’s module identifiers do not comply with the format of Ceylon module names."
shared alias Module
        => ModuleName|StringLiteral;

// this file is named Module_.ceylon, not Module.ceylon, to avoid a collision with module.ceylon on case-insensitive file systems
