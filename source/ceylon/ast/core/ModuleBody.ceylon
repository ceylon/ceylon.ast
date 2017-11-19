"""A [[module descriptor|ModuleDescriptor]] body, that is,
   any number of [[module imports|ModuleImport]],
   optionally preceded by any number of [[constant definitions|ValueDefinition]],
   surrounded by braces.
   
   (Because a module body can’t contain procedural code, this is not a subclass of [[Body]].
   If a future version of Ceylon allows procedural code in a module body, then this may change.)
   
   Examples (multi-line):
   
       {}
       
       {
           shared import ceylon.test "1.2.0";
       }
       
       {
           value languageVersion = "1.3.3";
           import ceylon.collection languageVersion;
           import ceylon.test languageVersion;
       }"""
shared class ModuleBody(moduleImports = [], constantDefinitions = [])
        extends Node() {
    
    "The module imports."
    shared ModuleImport[] moduleImports;
    
    "The constant definitions.
     
     For each constant definition,
     the [[type|ValueDefinition.type]] must be a [[ValueModifier]],
     the [[annotations|ValueDefinition.annotations]] must be empty,
     and the [[definition|ValueDefinition.definition]]’s [[expression|AnySpecifier.expression]] must be a [[StringLiteral]]."
    shared ValueDefinition[] constantDefinitions;
    
    assert (constantDefinitions.every((ValueDefinition constantDefinition) =>
                constantDefinition.type is ValueModifier &&
                        constantDefinition.annotations.children.empty &&
                        constantDefinition.definition.expression is StringLiteral
        ));
    
    shared actual <ModuleImport|ValueDefinition>[] children = concatenate(constantDefinitions, moduleImports);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleBody(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitModuleBody(this);
    
    shared actual Boolean equals(Object that) {
        if (is ModuleBody that) {
            return moduleImports==that.moduleImports && constantDefinitions==that.constantDefinitions;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (moduleImports.hash + 31*constantDefinitions.hash);
    
    shared ModuleBody copy(ModuleImport[] moduleImports = this.moduleImports, ValueDefinition[] constantDefinitions = this.constantDefinitions) {
        value ret = ModuleBody(moduleImports, constantDefinitions);
        copyExtraInfoTo(ret);
        return ret;
    }
}
