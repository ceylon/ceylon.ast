"""A module descriptor:
   a list of annotations, followed by the keyword ‘`module’`,
   the module [[name]],
   an optional [[specifier]],
   and the module [[version]] and [[body]].
   
   Examples (multi-line):
       
       module tmp "1.0.0" {}
   
       "Tests for the [[ceylon.ast.core module|module ceylon.ast.core]]"
       by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
       license ("http://www.apache.org/licenses/LICENSE-2.0.html")
       module test.ceylon.ast.core "1.2.0" {
           shared import ceylon.test "1.2.0";
           import ceylon.ast.core "1.2.0";
       }"""
shared class ModuleDescriptor(name, version, body = ModuleBody(), annotations = Annotations(), specifier = null)
        extends Node() {
    
    "The module name."
    shared ModuleName name;
    "The module version.
     
     (No constraints on the version – allowed characters, length, etc. – are specified,
     but some versions crash the compiler, and constraints *will* likely
     be specified at some point.)"
    shared StringLiteral version;
    "The module body."
    shared ModuleBody body;
    "The module’s annotations.
     The most commonly used are:
     
     - documentation
     - [[license]]
     - [[by]]"
    shared Annotations annotations;
    "The module specifier,
     defining a mapping to a foreign module system to which the module will be exported,
     if present."
    shared ModuleSpecifier? specifier;
    
    shared actual [Annotations, ModuleName, ModuleSpecifier, StringLiteral, ModuleBody]|[Annotations, ModuleName, StringLiteral, ModuleBody] children
            = if (exists specifier) then [annotations, name, specifier, version, body] else [annotations, name, version, body];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleDescriptor(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitModuleDescriptor(this);
    
    shared actual Boolean equals(Object that) {
        if (is ModuleDescriptor that) {
            if (exists specifier) {
                if (exists specifier_ = that.specifier) {
                    if (specifier != specifier_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.specifier exists) {
                return false;
            }
            return name==that.name && version==that.version && body==that.body && annotations==that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (version.hash + 31 * (body.hash + 31 * (annotations.hash + 31 * (specifier?.hash else 0)))));
    
    shared ModuleDescriptor copy(ModuleName name = this.name, StringLiteral version = this.version, ModuleBody body = this.body, Annotations annotations = this.annotations, ModuleSpecifier? specifier = this.specifier) {
        value ret = ModuleDescriptor(name, version, body, annotations, specifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
