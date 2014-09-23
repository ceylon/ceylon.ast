"An invocation or member expression, written in an operator-style syntax.
 
 Examples:
 
     val and #3FFF
     text map Character.uppercased
     0..max by step
     bits not
     set subset otherSet"
shared abstract class OperatorStyleExpression()
        of OperatorStyleMemberExpression
        extends Expression() {
}
