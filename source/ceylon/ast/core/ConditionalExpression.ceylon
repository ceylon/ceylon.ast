"""A conditional expression.
   
   Conditional expressions resemble [[control structures|ControlStructure]],
   but are part of the expression syntax and evaluate to values.
   
   Examples (multi-line):
   
       if (is Box<Type> that)
           this.content == that.content
   
       switch (first.age <=> second.age)
       case (smaller) "younger"
       case (equal) "of the same age as"
       case (larger) "older than""""
shared abstract class ConditionalExpression()
        of IfElseExpression
        extends Expression() {
}
