"""Tests for the [[ceylon.ast RedHat backend|module ceylon.ast.redhat]].
   
   Two things are tested:
   - parsing a code string into a `ceylon.ast` AST node, and
   - conversion of a `ceylon.ast` node to a RedHat AST node, and then back to a `ceylon.ast` node.
   
   Parsing is tested in a [[ParsingTest]], using a single function to
   [[parse|ParsingTest.parse]] the code.
   
   Conversion is tested in a [[ConversionTest]], using two functions:
   one to convert [[from `ceylon.ast`|ConversionTest.fromCeylon]] to the RedHat AST,
   and one to convert from the RedHat AST [[to `ceylon.ast`|ConversionTest.toCeylon]].
   
   ### Testing concrete classes
   
   For each concrete class, there is a toplevel test object implementing [[ConcreteTest]].
   [[ConcreteTest]] satisfies [[ParsingTest]] and [[ConversionTest]], and the object
   provides the three methods mentioned before, like this:
   ~~~
   parse = parseSumOperation;
   fromCeylon = RedHatTransformer.transformSumOperation;
   toCeylon = sumOperationToCeylon;
   ~~~
   It also provides a sequence of [[codes|CodesProvider.codes]] to be tested,
   `String->CeylonAstType` entries that are used for both parsing and conversion testing.
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
   [[AbstractTest]] also satisfies [[ParsingTest]] and [[ConversionTest]], but collects
   its [[codes|CodesProvider.codes]] via a sequence of [[tests|AbstractTest.tests]], which the
   test object provides. An abstract test object is usually no longer than this:
   ~~~
   shared object variance satisfies AbstractTest<Variance,JTypeVariance> {
       parse = parseVariance;
       fromCeylon = RedHatTransformer.transformVariance;
       toCeylon = varianceToCeylon;
       
       tests = [inModifier, outModifier];
   }
   ~~~"""
by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
license ("http://www.apache.org/licenses/LICENSE-2.0.html")
native ("jvm") module test.ceylon.ast.redhat "1.3.2-SNAPSHOT" {
    shared import ceylon.test "1.3.2-SNAPSHOT";
    shared import ceylon.ast.redhat "1.3.2-SNAPSHOT";
    import ceylon.ast.create "1.3.2-SNAPSHOT";
    import ceylon.ast.samples "1.3.2-SNAPSHOT";
    import ceylon.formatter "1.3.2-SNAPSHOT";
}
