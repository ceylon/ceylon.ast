"A specification statement.
 
 Examples:
 
     offset = preamble.size + title.size;
     debug(Anything a) => process.writeErrorLine(a);"
shared abstract class Specification()
        of ValueSpecification | LazySpecification
        extends Statement() {
    
    "The name of the member being specified."
    shared formal LIdentifier name;
    "The specifier."
    shared formal AnySpecifier specifier;
}
