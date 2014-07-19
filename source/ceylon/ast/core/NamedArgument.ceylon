"A named argument.
 
 Examples:
 
     name;
     size = width * height;
     Color color(Integer x, Integer y) => red;"
shared abstract class NamedArgument()
        of AnonymousArgument | SpecifiedArgument
        extends ExpressionIsh() {
}
