"""A module descriptor:
   a list of annotations, followed by the keyword ‘`module’`, and then the module [[name]], [[version]] and [[body]].
   
   Examples (multi-line):
       
       module tmp "1.0.0" {}
   
       "Tests for the [[ceylon.ast.core module|module ceylon.ast.core]]"
       by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
       license ("http://www.apache.org/licenses/LICENSE-2.0.html")
       module test.ceylon.ast.core "1.2.0" {
           shared import ceylon.test "1.2.0";
           import ceylon.ast.core "1.2.0";
       }"""
shared class ModuleDescriptor(name, version, body = ModuleBody(), annotations = Annotations())
        extends Node() {
    
    "The module name."
    shared FullPackageName name;
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
    
    shared actual [Annotations, FullPackageName, StringLiteral, ModuleBody] children = [annotations, name, version, body];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleDescriptor(this);
    
    shared actual Boolean equals(Object that) {
        if (is ModuleDescriptor that) {
            return name == that.name && version == that.version && body == that.body && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (version.hash + 31 * (body.hash + 31 * annotations.hash)));
    
    shared ModuleDescriptor copy(FullPackageName name = this.name, StringLiteral version = this.version, ModuleBody body = this.body, Annotations annotations = this.annotations) {
        value ret = ModuleDescriptor(name, version, body, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
