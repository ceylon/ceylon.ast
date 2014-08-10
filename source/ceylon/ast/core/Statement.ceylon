"""A statement.
   
   Examples:
   
       value name = person.name else "<unnamed>";
       print("Hello, World!");"""
shared abstract class Statement()
        of Specification | ExpressionStatement
        extends Node() {
}
