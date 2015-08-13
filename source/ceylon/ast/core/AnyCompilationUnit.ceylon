"""A compilation unit.
   
   There are three kinds of compilation unit:
   - [[Regular compilation units|CompilationUnit]] contain toplevel type, value, or function definitions.
   - [[Module descriptor compilation units|ModuleCompilationUnit]] contain a [[module descriptor|ModuleDescriptor]].
   - [[Package descriptor compilation units|PackageCompilationUnit]] contain a [[package descriptor|PackageDescriptor]].
   
   (Because it is the most commonly used, and also what most people associate with a “compilation unit”,
   the first kind is simply called [[CompilationUnit]] and this abstract class is called `AnyCompilationUnit`,
   rather than calling this `CompilationUnit` and using `RegularCompilationUnit` or `CodeCompilationUnit`
   for regular compilation units.)
   
   Every compilation unit starts with a (possibly empty) list of [[imports]].
   
   Examples (separated by blank lines):
   
       module tmp "1.0.0" {}
   
       package tmp;
   
       void run() {
           print("Hello, World!");
       }"""
shared abstract class AnyCompilationUnit()
        of CompilationUnit | ModuleCompilationUnit | PackageCompilationUnit
        extends Node() {
    
    "The imports of this compilation unit."
    shared formal Import[] imports;
    
    /*
     Rather than a single attribute
     
         shared formal Declaration[]|ModuleDescriptor|PackageDescriptor content;
     
     we have three separate attributes; this way, AST consumers _can_ (but don’t have to)
     write their code in a way that will continue to work if it’s ever allowed to mix
     compilation unit contents (e. g., have module descriptor + run function in the same CU).
     */
    
    "The declarations in this compilation unit.
     
     (This attribute is empty for non-[[regular|CompilationUnit]] compilation units.)"
    shared formal Declaration[] declarations;
    "The module descriptor in this compilation unit.
     
     (This attribute is [[null]] for non-[[module descriptor|ModuleCompilationUnit]] compilation units.)"
    shared formal ModuleDescriptor? moduleDescriptor;
    "The package descriptor in this compilation unit.
     
     (This attribute is [[null]] for non-[[package descriptor|PackageDescriptor]] compilation units.)"
    shared formal PackageDescriptor? packageDescriptor;
    
    shared actual formal <Import|Declaration|ModuleDescriptor|PackageDescriptor>[] children;
}
