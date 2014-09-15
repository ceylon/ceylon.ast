"Demonstration of a [[ceylon.ast.core::Visitor]] and an [[ceylon.ast.core::Editor]].
 
 It is sometimes desireable to rewrite a body of the form
 ~~~
 if (condition) {
     return a;
 } else {
     return b;
 }
 ~~~
 into a series of statements without intermediate returns, like this:
 ~~~
 value ret;
 if (condition) {
     ret = a;
 } else {
     ret = b;
 }
 ~~~
 However, this is not possible for every block:
 ~~~
 if (condition) {
     return a;
 }
 return b;
 ~~~
 If we replace `return`s with `ret` assignments here,
 the second return would still be reached.
 
 [[hasEarlyReturns]] detects if a body contains such an early return
 by [[visit|ceylon.ast.core::Node.visit]]ing the body;
 [[rewriteReturnsToAssignments]] rewrites a body as shown above.
 
 This could be used for some [compiler optimizations](https://github.com/ceylon/ceylon-compiler/issues/1794)."
shared package ceylon.ast.samples.bodyReturnRewrite;
