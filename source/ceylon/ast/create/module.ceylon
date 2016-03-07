"""This module contains helper functions to simplify
   creating [[ceylon.ast|module ceylon.ast.core]]
   [[nodes|ceylon.ast.core::Node]].
   
   The most useful functions are [[baseExpression]] and [[baseType]],
   which allow you to abbreviate
   
       BaseExpression(MemberNameWithTypeArguments(LIdentifier("null")))
       BaseType(TypeNameWithTypeArguments(UIdentifier("String")))
   
   as
   
       baseExpression("null")
       baseType("String")
   
   Many of the functions in this package are also designed to be used
   with named arguments, where the “listed” argument (comma-separated)
   is assigned to the first unassigned iterable parameter.
   For example, we intend you to write
   
       annotations {
           documentation = "Documentation.";
           "shared", "actual", "default"
       }
   
   and not
   
       annotations {
           documentation = "Documentation.";
           annotations = { "shared", "actual", "default" };
       }
   
   This is especially important for the [[functionDefinition]],
   [[classDefinition]] and [[interfaceDefinition]] functions."""
module ceylon.ast.create "1.2.2" {
    shared import ceylon.ast.core "1.2.2";
    import ceylon.collection "1.2.2";
}
