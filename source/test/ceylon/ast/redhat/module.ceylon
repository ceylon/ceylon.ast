"""Tests for the [[ceylon.ast RedHat backend|module ceylon.ast.redhat]].
   
   Two things are tested:
   - compilation of a code string into a `ceylon.ast` AST node, and
   - conversion of a `ceylon.ast` node to a RedHat AST node, and then back to a `ceylon.ast` node.
   
   Compilation is tested in a [[CompilationTest]], using a single function to
   [[compile|CompilationTest.compile]] the code.
   
   Conversion is tested in a [[ConversionTest]], using two functions:
   one to convert [[from `ceylon.ast`|ConversionTest.fromCeylon]] to the RedHat AST,
   and one to convert from the RedHat AST [[to `ceylon.ast`|ConversionTest.toCeylon]].
   
   ### Testing concrete classes
   
   For each concrete class, there is a toplevel test object implementing [[ConcreteTest]].
   [[ConcreteTest]] satisfies [[CompilationTest]] and [[ConversionTest]], and the object
   provides the three methods mentioned before, like this:
   ~~~
   compile = compileSumOperation;
   fromCeylon = RedHatTransformer.transformSumOperation;
   toCeylon = sumOperationToCeylon;
   ~~~
   It also provides a sequence of [[codes|CodesProvider.codes]] to be tested,
   `String->CeylonAstType` entries that are used for both compilation and conversion testing.
   These codes are typically shared members of the object, constructed via an unshared
   `construct()` method that constructs them from other test codes:
   ~~~
   String->SumOperation construct(String->AddingExpression left, String->ScalingExpression right)
           => "``left.key``+``right.key``"->SumOperation(left.item, right.item);
           
   shared String->SumOperation onePlusOneExpression
           = construct(integerLiteral.oneIntegerLiteral, integerLiteral.oneIntegerLiteral);
   // ...
   
   codes = [onePlusOneExpression /*, ...*/];
   ~~~
   Thus, new test cases can be constructed from existing ones with relatively little effort.
   
   ### Testing abstract classes
   
   For each abstract class, there is also a toplevel test object, implementing [[AbstractTest]].
   [[AbstractTest]] also satisfies [[CompilationTest]] and [[ConversionTest]], but collects
   its [[codes|CodesProvider.codes]] via a sequence of [[tests|AbstractTest.tests]], which the
   test object provides. An abstract test object is usually no longer than this:
   ~~~
   shared object variance satisfies AbstractTest<Variance,JTypeVariance> {
       compile = compileVariance;
       fromCeylon = RedHatTransformer.transformVariance;
       toCeylon = varianceToCeylon;
       
       tests = [inModifier, outModifier];
   }
   ~~~"""
by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
license ("http://www.apache.org/licenses/LICENSE-2.0.html")
module test.ceylon.ast.redhat "1.1.0" {
    shared import ceylon.test "1.1.0";
    shared import ceylon.ast.redhat "1.1.0";
    import ceylon.ast.create "1.1.0";
    import ceylon.ast.samples "1.1.0";
    import ceylon.formatter "1.1.0";
}
