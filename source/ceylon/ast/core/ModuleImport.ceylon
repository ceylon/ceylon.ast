"""An import of another module within a [[module descriptor|ModuleDescriptor]].
   
   Each module import consists of a list of [[annotations]], followed by the keyword ‘`import`’,
   the [[name]] of the imported module,
   and the [[version]] of the imported module, terminated by a semicolon.
   
   Examples:
   
       shared import ceylon.test "1.3.3";
       import ceylon.collection languageVersion;
       import maven:"commons-codec":"commons-codec" "1.4";"""
shared class ModuleImport(name, version, annotations = Annotations())
        extends Node() {
    
    "The name or specifier of the imported module.
     
     For proper Ceylon modules, this should be a [[ModuleName]];
     [[string literals|StringLiteral]] are allowed for interoperation with legacy Java code,
     and a [[ModuleSpecifier]], with a repository, free-form name and optional artifact
     can be used for specifying modules residing in a foreign module repository system."
    shared Module|ModuleSpecifier name;
    "The version of the imported module,
     usually a string literal.
     
     The version can also be a base expression
     referring to a [[constant definition|ModuleBody.constantDefinitions]] in the module body.
     Its identifier must be lowercase and it must not have any type arguments."
    shared StringLiteral|BaseExpression version;
    "The annotations on the module import."
    shared Annotations annotations;

    if (is BaseExpression version) {
        "The version constant must be a lowercase identifier without type arguments"
        assert (version.nameAndArgs.name is LIdentifier,
            !version.nameAndArgs.typeArguments exists);
    }
    
    shared actual [Annotations, Module|ModuleSpecifier, StringLiteral|BaseExpression] children = [annotations, name, version];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleImport(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitModuleImport(this);
    
    shared actual Boolean equals(Object that) {
        if (is ModuleImport that) {
            return name==that.name && version==that.version && annotations==that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (version.hash + 31*annotations.hash));
    
    shared ModuleImport copy(Module|ModuleSpecifier name = this.name, StringLiteral|BaseExpression version = this.version, Annotations annotations = this.annotations) {
        value ret = ModuleImport(name, version, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
