"A specification statement.
 
 Examples:
 
     offset = preamble.size + title.size;
     debug(Anything a) => process.writeErrorLine(a);"
shared abstract class Specification()
        of ValueSpecification
        extends Statement() {
}
