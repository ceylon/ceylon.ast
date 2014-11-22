"""This module defines types for a Ceylon Abstract Syntax Tree (AST),
   a hierarchical and immutable data structure that represents a Ceylon program.
   
   
   # Obtaining an AST
   
   There are two major ways to obtain an AST:
   
   
   ## Create it yourself
   
   You can of course construct the AST yourself.
   To reduce the amount of boilerplate code necessary, we *strongly* recommend
   using the [[`ceylon.ast.create` module|module ceylon.ast.create]];
   this will, for example, allow you to write
   
       baseExpression("null")
       
   instead of
   
       BaseExpression(MemberNameWithTypeArguments(LIdentifier("null")))
   
   
   ## Compile it
   
   The [[`ceylon.ast.redhat` module|module ceylon.ast.redhat]] allows you to
   compile any AST node from a corresponding code string (internally using the
   RedHat Ceylon compiler).
   
   If you have a node from the RedHat AST, you can also convert it using
   that module.
   
   
   # Operating on an AST
   
   
   ## Analyze it
   
   You can analyze an AST node (and its child nodes) using the [[Visitor]]
   interface.
   For example, you can count the amount of `else if` snippets like this:
   
   ~~~ceylon
   variable Integer elseIfCount = 0;
   that.visit {
       object visitor satisfies Visitor {
           shared actual void visitElseClause(ElseClause that) {
               if (that.child is IfElse) {
                   elseIfCount++;
               }
               super.visitElseClause(that);
           }
       }
   };
   ~~~
   
   [[Visitor]] takes care of the AST traversal for you;
   you only need to override the functions that correspond to the nodes
   that concern you.
   
   
   ### Attaching additional information
   
   You can also attach your analysis results to the AST nodes.
   To do this, you first need to create a [[Key]]:
   
       shared Key<Token[]> tokensKey
           = ScopedKey<Token[]>(`module my.parser`, "tokens");
   
   (We recommend the use of [[ScopedKey]] to avoid naming collisions.)
   
   Then, you can attach information using [[Node.put]]
   
       node.put(tokensKey, tokens)
   
   and later retrieve it with [[Node.get]] (perhaps in a different module):
   
       assert (exists tokens = node.get(tokensKey));
   
   The key is typed, so you don’t lose typing information (except about the
   presence of the attached information).
   
   
   ## Edit it
   
   Since the AST is immutable, you can’t edit it directly.
   However, you can easily obtain an edited copy using the [[Editor]]
   interface.
   For example, you can replace `else if`s with `else { if … }`s like this:
   
   ~~~ceylon
   that.transform {
       object transformer satisfies Editor {
           shared actual ElseClause transformElseClause(ElseClause that) {
               if (is IfElse ifElse = that.child) {
                   return that.copy {
                       child = Block([ifElse]);
                   };
               } else {
                   return super.transformElseClause(that);
               }
           }
       }
   };
   ~~~
   
   [[Editor]] performs a deep copy by default;
   again, you only need to override the functions that correspond to the
   nodes that concern you.
   
   
   # Consuming an AST
   
   You can also transform your AST into something completely different
   using the [[Transformer]] interface.
   
   A `Transformer<Something>` transforms an AST into an instance of
   `Something`.
   Here are a few examples:
   
   ## [[CeylonExpressionTransformer]]
   
   [[CeylonExpressionTransformer]] is a `Transformer<String>` and transforms
   individual nodes like this:
   
   ~~~ceylon
   transformSumOperation(SumOperation that)
           => "SumOperation {
                   leftSummand = ``that.leftSummand.transform(this)``;
                   rightSummand = ``that.rightSummand.transform(this)``;
               }";
   ~~~
   (In reality it’s a bit more complicated because we need to deal with
   indentation.)
   
   While the traversal doesn’t happen automatically, it’s mostly taken care of
   by the `ceylon.ast` infrastructure, at least if your resulting
   representation retains the node hierarchy (here: direct use of
   `child.transform(this)`).
   
   ## `RedHatTransformer`
   
   `RedHatTransformer`, in the
   [[`ceylon.ast.redhat` module|module ceylon.ast.redhat]], is a
   `Transformer<JNode>` (where `JNode` is an import alias for RedHat AST nodes).
   It can be used to transform a `ceylon.ast` node to a RedHat AST node.
   This node can then, for example, be fed into the RedHat Ceylon compiler
   to compile it, or into the [[`ceylon.formatter`|module ceylon.formatter]]
   to generate code for it ([[ceylon.formatter::format]] function).
   
   ## `Editor`
   
   [[Editor]] is a `Transformer<Node>`, that is, a transformer from
   `ceylon.ast` to `ceylon.ast`.
   (That’s why the methods it uses are called `transform` and not `edit`.)
   
   ## `Visitor`
   
   [[Visitor]] is a `Transformer<Anything>`, that is, a transformer
   from `ceylon.ast` to `void` (nothing).
   The traversal mechanism comes from [[WideningTransformer]], which you may
   also use yourself.
   
   
   # Meaning of an AST
   
   An AST node represents a syntactically valid Ceylon program.
   It doesn’t necessarily have to be *semantically* valid;
   for example, the following expression
   
       null.wrdlbrmpfd(nothing.attr)
   
   will not compile, but has a perfectly valid AST representation.
   On the other hand, you cannot create an
   
       LIdentifier("My Identifier")
   
   (it will throw an [[AssertionError]] at runtime), because `My Identifier`
   is not a syntactically valid lowercase identifier.
   
   Likewise, equality of nodes ([[Node.equals]]) only means syntactic equality:
   Even though the following two *types* are equal
   
       String|Integer
       Integer|String
   
   their AST nodes are not.
   
   The distinction between syntactical and semantical restrictions is sometimes
   unclear or ambiguous; note especially that the RedHat compiler’s parser
   (grammar) allows (for better error messages) some syntax that is refused
   in `ceylon.ast` (for example, empty resource lists for `try`).
   `ceylon.ast` seeks to comply only with the [Ceylon Language Specification][spec],
   not its implementation in the compiler.
   
   [spec]: http://ceylon-lang.org/documentation/1.0/spec/html_single/"""
by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
license ("http://www.apache.org/licenses/LICENSE-2.0.html")
module ceylon.ast.core "1.1.1" {
    import ceylon.collection "1.1.1";
}
