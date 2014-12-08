"Builds a Ceylon expression string for an AST node;
 compiling and evaluating the resulting string will yield
 a copy of the transformed node.
 
 Usage:
 ~~~
 myNode.transform(CeylonExpressionTransformer());
 ~~~"
shared class CeylonExpressionTransformer(String indentLevel = "    ") satisfies ImmediateNarrowingTransformer<String> {
    
    variable String indent = "";
    
    String transformWithIndent(Node|Node[]|Null that) {
        switch (that)
        case (is Node) {
            value origIndent = indent;
            indent += indentLevel;
            value ret = that.transform(this);
            indent = origIndent;
            return ret;
        }
        case (is []) {
            return "[]";
        }
        case (null) {
            return "null";
        }
        else { // case (is [Node+]) { – but Node and [Node+] are not disjoint, because Sequence is a sealed interface, not a class
            value origIndent = indent;
            indent += indentLevel + indentLevel;
            value firstString = that.first.transform(this);
            value multiLine = that.size > 1 || firstString.lines.longerThan(1);
            StringBuilder code = StringBuilder();
            code.append("[");
            if (multiLine) {
                code.appendNewline();
                code.append(indent);
            }
            code.append(firstString);
            for (node in that.rest) {
                code.append(",");
                code.appendNewline();
                code.append(indent);
                code.append(node.transform(this));
            }
            if (multiLine) {
                code.appendNewline();
                code.append(origIndent + indentLevel);
            }
            code.append("]");
            indent = origIndent;
            return code.string;
        }
    }
    
    transformAddAssignmentOperation(AddAssignmentOperation that)
            => "AddAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``summand = ``transformWithIndent(that.summand)``;
                ``indent``}";
    transformAliasDec(AliasDec that)
            => that.qualifier exists
            then "AliasDec {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``qualifier = ``transformWithIndent(that.qualifier)``;
                  ``indent``}"
            else "AliasDec(``transformWithIndent(that.name)``)";
    transformAndAssignmentOperation(AndAssignmentOperation that)
            => "AndAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``other = ``transformWithIndent(that.other)``;
                ``indent``}";
    transformAndOperation(AndOperation that)
            => "AndOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformArgumentList(ArgumentList that)
            => that.sequenceArgument exists
            then "ArgumentList {
                  `` indent + indentLevel ``listedArguments = ``transformWithIndent(that.listedArguments)``;
                  `` indent + indentLevel ``sequenceArgument = ``transformWithIndent(that.sequenceArgument)``;
                  ``indent``}"
            else "ArgumentList(``transformWithIndent(that.listedArguments)``)";
    transformAnnotation(Annotation that)
            => that.arguments exists
            then "Annotation {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``arguments = ``transformWithIndent(that.arguments)``;
                  ``indent``}"
            else "Annotation(``transformWithIndent(that.name)``)";
    transformAnnotations(Annotations that)
            => that.anonymousAnnotation exists
            then (that.annotations nonempty
                then "Annotations {
                      `` indent + indentLevel ``anonymousAnnotation = ``transformWithIndent(that.anonymousAnnotation)``;
                      `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                      ``indent``}"
                else "Annotations(``transformWithIndent(that.anonymousAnnotation)``)")
            else (that.annotations nonempty
                then "Annotations {
                      `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                      ``indent``}"
                else "Annotations()");
    transformAnonymousArgument(AnonymousArgument that) => "AnonymousArgument(``transformWithIndent(that.expression)``)";
    transformAssertion(Assertion that)
            => "Assertion {
                `` indent + indentLevel ``conditions = ``transformWithIndent(that.conditions)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformAssignOperation(AssignOperation that)
            => "AssignOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``expression = ``transformWithIndent(that.expression)``;
                ``indent``}";
    transformAssignmentStatement(AssignmentStatement that) => "AssignmentStatement(``transformWithIndent(that.expression)``)";
    transformBaseExpression(BaseExpression that) => "BaseExpression(``transformWithIndent(that.nameAndArgs)``)";
    transformBaseMeta(BaseMeta that) => "BaseMeta(``transformWithIndent(that.nameAndArgs)``)";
    transformBaseType(BaseType that) => "BaseType(``transformWithIndent(that.nameAndArgs)``)";
    transformBlock(Block that) => "Block(``transformWithIndent(that.content)``)";
    transformBooleanCondition(BooleanCondition that) => "BooleanCondition(``transformWithIndent(that.condition)``)";
    transformBreak(Break that) => "Break()";
    transformCallableParameter(CallableParameter that)
            => "CallableParameter {
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``parameterLists = ``transformWithIndent(that.parameterLists)``;
                ``indent``}";
    transformCallableType(CallableType that)
            => "CallableType {
                `` indent + indentLevel ``returnType = ``transformWithIndent(that.returnType)``;
                `` indent + indentLevel ``argumentTypes = ``transformWithIndent(that.argumentTypes)``;
                ``indent``}";
    transformCaseClause(CaseClause that)
            => "CaseClause {
                `` indent + indentLevel ``caseItem = ``transformWithIndent(that.caseItem)``;
                `` indent + indentLevel ``block = ``transformWithIndent(that.block)``;
                ``indent``}";
    transformCaseTypes(CaseTypes that) => "CaseTypes(``transformWithIndent(that.caseTypes)``)";
    transformCatchClause(CatchClause that)
            => "CatchClause {
                `` indent + indentLevel ``variable = ``transformWithIndent(that.variable)``;
                `` indent + indentLevel ``block = ``transformWithIndent(that.block)``;
                ``indent``}";
    transformCharacterLiteral(CharacterLiteral that) => "CharacterLiteral(\"\"\"``that.text``\"\"\")";
    transformClassAliasDefinition(ClassAliasDefinition that)
            => "ClassAliasDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``parameters = ``transformWithIndent(that.parameters)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                `` indent + indentLevel ``caseTypes = ``transformWithIndent(that.caseTypes)``;
                `` indent + indentLevel ``extendedType = ``transformWithIndent(that.extendedType)``;
                `` indent + indentLevel ``satisfiedTypes = ``transformWithIndent(that.satisfiedTypes)``;
                `` indent + indentLevel ``typeParameters = ``transformWithIndent(that.typeParameters)``;
                `` indent + indentLevel ``typeConstraints = ``transformWithIndent(that.typeConstraints)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformClassBody(ClassBody that) => "ClassBody(``transformWithIndent(that.content)``)";
    transformClassDec(ClassDec that)
            => that.qualifier exists
            then "ClassDec {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``qualifier = ``transformWithIndent(that.qualifier)``;
                  ``indent``}"
            else "ClassDec(``transformWithIndent(that.name)``)";
    transformClassDefinition(ClassDefinition that)
            => "ClassDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``parameters = ``transformWithIndent(that.parameters)``;
                `` indent + indentLevel ``body = ``transformWithIndent(that.body)``;
                `` indent + indentLevel ``caseTypes = ``transformWithIndent(that.caseTypes)``;
                `` indent + indentLevel ``extendedType = ``transformWithIndent(that.extendedType)``;
                `` indent + indentLevel ``satisfiedTypes = ``transformWithIndent(that.satisfiedTypes)``;
                `` indent + indentLevel ``typeParameters = ``transformWithIndent(that.typeParameters)``;
                `` indent + indentLevel ``typeConstraints = ``transformWithIndent(that.typeConstraints)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformClassInstantiation(ClassInstantiation that)
            => "ClassInstantiation {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``arguments = ``transformWithIndent(that.arguments)``;
                `` indent + indentLevel ``qualifier = ``transformWithIndent(that.qualifier)``;
                ``indent``}";
    transformClassSpecifier(ClassSpecifier that) => "ClassSpecifier(``transformWithIndent(that.instantiation)``)";
    transformClosedBound(ClosedBound that) => "ClosedBound(``transformWithIndent(that.endpoint)``)";
    transformCompareOperation(CompareOperation that)
            => "CompareOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformCompilationUnit(CompilationUnit that)
            => "CompilationUnit {
                `` indent + indentLevel ``imports = ``transformWithIndent(that.imports)``;
                `` indent + indentLevel ``declarations = ``transformWithIndent(that.declarations)``;
                ``indent``}";
    transformComplementAssignmentOperation(ComplementAssignmentOperation that)
            => "ComplementAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``other = ``transformWithIndent(that.other)``;
                ``indent``}";
    transformComplementOperation(ComplementOperation that)
            => "ComplementOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformComprehension(Comprehension that) => "Comprehension(``transformWithIndent(that.clause)``)";
    transformConditions(Conditions that) => "Conditions(``transformWithIndent(that.conditions)``)";
    transformContinue(Continue that) => "Continue()";
    transformDecQualifier(DecQualifier that) => "DecQualifier(``transformWithIndent(that.components)``)";
    transformDefaultedCallableParameter(DefaultedCallableParameter that)
            => "DefaultedCallableParameter {
                `` indent + indentLevel ``parameter = ``transformWithIndent(that.parameter)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformDefaultedParameterReference(DefaultedParameterReference that)
            => "DefaultedParameterReference {
                `` indent + indentLevel ``parameter = ``transformWithIndent(that.parameter)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformDefaultedType(DefaultedType that) => "DefaultedType(``transformWithIndent(that.type)``)";
    transformDefaultedValueParameter(DefaultedValueParameter that)
            => "DefaultedValueParameter {
                `` indent + indentLevel ``parameter = ``transformWithIndent(that.parameter)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformDifferenceOperation(DifferenceOperation that)
            => "DifferenceOperation {
                `` indent + indentLevel ``minuend = ``transformWithIndent(that.minuend)``;
                `` indent + indentLevel ``subtrahend = ``transformWithIndent(that.subtrahend)``;
                ``indent``}";
    transformDivideAssignmentOperation(DivideAssignmentOperation that)
            => "DivideAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``divisor = ``transformWithIndent(that.divisor)``;
                ``indent``}";
    transformDynamicBlock(DynamicBlock that) => "DynamicBlock(``transformWithIndent(that.block)``)";
    transformDynamicInterfaceDefinition(DynamicInterfaceDefinition that)
            => "DynamicInterfaceDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``body = ``transformWithIndent(that.body)``;
                `` indent + indentLevel ``caseTypes = ``transformWithIndent(that.caseTypes)``;
                `` indent + indentLevel ``satisfiedTypes = ``transformWithIndent(that.satisfiedTypes)``;
                `` indent + indentLevel ``typeParameters = ``transformWithIndent(that.typeParameters)``;
                `` indent + indentLevel ``typeConstraints = ``transformWithIndent(that.typeConstraints)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformDynamicModifier(DynamicModifier that) => "DynamicModifier()";
    transformDynamicValue(DynamicValue that)
            => "DynamicValue {
                `` indent + indentLevel ``namedArguments = ``transformWithIndent(that.namedArguments)``;
                `` indent + indentLevel ``iterableArgument = ``transformWithIndent(that.iterableArgument)``;
                `` indent + indentLevel ``modifier = ``transformWithIndent(that.modifier)``;
                ``indent``}";
    transformElementOrSubrangeExpression(ElementOrSubrangeExpression that)
            => "ElementOrSubrangeExpression {
                `` indent + indentLevel ``primary = ``transformWithIndent(that.primary)``;
                `` indent + indentLevel ``subscript = ``transformWithIndent(that.subscript)``;
                ``indent``}";
    transformElseCaseClause(ElseCaseClause that) => "ElseCaseClause(``transformWithIndent(that.block)``)";
    transformElseClause(ElseClause that) => "ElseClause(``transformWithIndent(that.child)``)";
    transformElseOperation(ElseOperation that)
            => "ElseOperation {
                `` indent + indentLevel ``optionalValue = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``defaultValue = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformEntryOperation(EntryOperation that)
            => "EntryOperation {
                `` indent + indentLevel ``key = ``transformWithIndent(that.key)``;
                `` indent + indentLevel ``item = ``transformWithIndent(that.item)``;
                ``indent``}";
    transformEntryType(EntryType that)
            => "EntryType {
                `` indent + indentLevel ``key = ``transformWithIndent(that.key)``;
                `` indent + indentLevel ``item = ``transformWithIndent(that.item)``;
                ``indent``}";
    transformEqualOperation(EqualOperation that)
            => "EqualOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformExistsCondition(ExistsCondition that) => "ExistsCondition(``transformWithIndent(that.variable)``)";
    transformExistsOperation(ExistsOperation that) => "ExistsOperation(``transformWithIndent(that.operand)``)";
    transformExponentiationOperation(ExponentiationOperation that)
            => "ExponentiationOperation {
                `` indent + indentLevel ``base = ``transformWithIndent(that.base)``;
                `` indent + indentLevel ``exponent = ``transformWithIndent(that.exponent)``;
                ``indent``}";
    transformExpressionComprehensionClause(ExpressionComprehensionClause that) => "ExpressionComprehensionClause(``transformWithIndent(that.expression)``)";
    transformExtendedType(ExtendedType that) => "ExtendedType(``transformWithIndent(that.instantiation)``)";
    transformFailClause(FailClause that) => "FailClause(``transformWithIndent(that.block)``)";
    transformFinallyClause(FinallyClause that) => "FinallyClause(``transformWithIndent(that.block)``)";
    transformFloatLiteral(FloatLiteral that) => "FloatLiteral(\"``that.text``\")";
    transformForClause(ForClause that)
            => "ForClause {
                `` indent + indentLevel ``iterator = ``transformWithIndent(that.iterator)``;
                `` indent + indentLevel ``block = ``transformWithIndent(that.block)``;
                ``indent``}";
    transformForComprehensionClause(ForComprehensionClause that)
            => "ForComprehensionClause {
                `` indent + indentLevel ``iterator = ``transformWithIndent(that.iterator)``;
                `` indent + indentLevel ``clause = ``transformWithIndent(that.clause)``;
                ``indent``}";
    transformForFail(ForFail that)
            => "ForFail {
                `` indent + indentLevel ``forClause = ``transformWithIndent(that.forClause)``;
                `` indent + indentLevel ``failClause = ``transformWithIndent(that.failClause)``;
                ``indent``}";
    transformFullPackageName(FullPackageName that) => "FullPackageName(``transformWithIndent(that.components)``)";
    transformFunctionArgument(FunctionArgument that)
            => "FunctionArgument {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``parameterLists = ``transformWithIndent(that.parameterLists)``;
                `` indent + indentLevel ``definition = ``transformWithIndent(that.definition)``;
                ``indent``}";
    transformFunctionDec(FunctionDec that)
            => that.qualifier exists
            then "FunctionDec {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``qualifier = ``transformWithIndent(that.qualifier)``;
                  ``indent``}"
            else "FunctionDec(``transformWithIndent(that.name)``)";
    transformFunctionDeclaration(FunctionDeclaration that)
            => "FunctionDeclaration {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``parameterLists = ``transformWithIndent(that.parameterLists)``;
                `` indent + indentLevel ``typeParameters = ``transformWithIndent(that.typeParameters)``;
                `` indent + indentLevel ``typeConstraints = ``transformWithIndent(that.typeConstraints)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformFunctionDefinition(FunctionDefinition that)
            => "FunctionDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``parameterLists = ``transformWithIndent(that.parameterLists)``;
                `` indent + indentLevel ``definition = ``transformWithIndent(that.definition)``;
                `` indent + indentLevel ``typeParameters = ``transformWithIndent(that.typeParameters)``;
                `` indent + indentLevel ``typeConstraints = ``transformWithIndent(that.typeConstraints)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformFunctionExpression(FunctionExpression that)
            => "FunctionExpression {
                `` indent + indentLevel ``parameterLists = ``transformWithIndent(that.parameterLists)``;
                `` indent + indentLevel ``definition = ``transformWithIndent(that.definition)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                ``indent``}";
    transformFunctionModifier(FunctionModifier that) => "FunctionModifier()";
    transformFunctionShortcutDefinition(FunctionShortcutDefinition that)
            => "FunctionShortcutDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``parameterLists = ``transformWithIndent(that.parameterLists)``;
                `` indent + indentLevel ``definition = ``transformWithIndent(that.definition)``;
                `` indent + indentLevel ``typeParameters = ``transformWithIndent(that.typeParameters)``;
                `` indent + indentLevel ``typeConstraints = ``transformWithIndent(that.typeConstraints)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformGivenDec(GivenDec that) => "GivenDec(``transformWithIndent(that.name)``)";
    transformGroupedExpression(GroupedExpression that) => "GroupedExpression(``transformWithIndent(that.innerExpression)``)";
    transformGroupedType(GroupedType that) => "GroupedType(``transformWithIndent(that.type)``)";
    transformIdenticalOperation(IdenticalOperation that)
            => "IdenticalOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformIdentityOperation(IdentityOperation that) => "IdentityOperation(``transformWithIndent(that.operand)``)";
    transformIfClause(IfClause that)
            => "IfClause {
                `` indent + indentLevel ``conditions = ``transformWithIndent(that.conditions)``;
                `` indent + indentLevel ``block = ``transformWithIndent(that.block)``;
                ``indent``}";
    transformIfComprehensionClause(IfComprehensionClause that)
            => "IfComprehensionClause {
                `` indent + indentLevel ``conditions = ``transformWithIndent(that.conditions)``;
                `` indent + indentLevel ``clause = ``transformWithIndent(that.clause)``;
                ``indent``}";
    transformIfElse(IfElse that)
            => "IfElse {
                `` indent + indentLevel ``ifClause = ``transformWithIndent(that.ifClause)``;
                `` indent + indentLevel ``elseClause = ``transformWithIndent(that.elseClause)``;
                ``indent``}";
    transformIfElseExpression(IfElseExpression that)
            => "IfElseExpression {
                `` indent + indentLevel ``conditions = ``transformWithIndent(that.conditions)``;
                `` indent + indentLevel ``thenExpression = ``transformWithIndent(that.thenExpression)``;
                `` indent + indentLevel ``elseExpression = ``transformWithIndent(that.elseExpression)``;
                ``indent``}";
    transformImport(Import that)
            => "Import {
                `` indent + indentLevel ``packageName = ``transformWithIndent(that.packageName)``;
                `` indent + indentLevel ``elements = ``transformWithIndent(that.elements)``;
                ``indent``}";
    transformImportElements(ImportElements that)
            => "ImportElements {
                `` indent + indentLevel ``elements = ``transformWithIndent(that.elements)``;
                `` indent + indentLevel ``wildcard = ``transformWithIndent(that.wildcard)``;
                ``indent``}";
    transformImportFunctionValueAlias(ImportFunctionValueAlias that) => "ImportFunctionValueAlias(``transformWithIndent(that.name)``)";
    transformImportFunctionValueElement(ImportFunctionValueElement that)
            => "ImportFunctionValueElement {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``importAlias = ``transformWithIndent(that.importAlias)``;
                `` indent + indentLevel ``nestedImports = ``transformWithIndent(that.nestedImports)``;
                ``indent``}";
    transformImportTypeAlias(ImportTypeAlias that) => "ImportTypeAlias(``transformWithIndent(that.name)``)";
    transformImportTypeElement(ImportTypeElement that)
            => "ImportTypeElement {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``importAlias = ``transformWithIndent(that.importAlias)``;
                `` indent + indentLevel ``nestedImports = ``transformWithIndent(that.nestedImports)``;
                ``indent``}";
    transformImportWildcard(ImportWildcard that) => "ImportWildcard()";
    transformInModifier(InModifier that) => "InModifier()";
    transformInOperation(InOperation that)
            => "InOperation {
                `` indent + indentLevel ``element = ``transformWithIndent(that.element)``;
                `` indent + indentLevel ``category = ``transformWithIndent(that.category)``;
                ``indent``}";
    transformIntegerLiteral(IntegerLiteral that) => "IntegerLiteral(\"``that.text``\")";
    transformInterfaceAliasDefinition(InterfaceAliasDefinition that)
            => "InterfaceAliasDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                `` indent + indentLevel ``caseTypes = ``transformWithIndent(that.caseTypes)``;
                `` indent + indentLevel ``satisfiedTypes = ``transformWithIndent(that.satisfiedTypes)``;
                `` indent + indentLevel ``typeParameters = ``transformWithIndent(that.typeParameters)``;
                `` indent + indentLevel ``typeConstraints = ``transformWithIndent(that.typeConstraints)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformInterfaceBody(InterfaceBody that) => "InterfaceBody(``transformWithIndent(that.content)``)";
    transformInterfaceDec(InterfaceDec that)
            => that.qualifier exists
            then "InterfaceDec {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``qualifier = ``transformWithIndent(that.qualifier)``;
                  ``indent``}"
            else "InterfaceDec(``transformWithIndent(that.name)``)";
    transformInterfaceDefinition(InterfaceDefinition that)
            => "InterfaceDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``body = ``transformWithIndent(that.body)``;
                `` indent + indentLevel ``caseTypes = ``transformWithIndent(that.caseTypes)``;
                `` indent + indentLevel ``satisfiedTypes = ``transformWithIndent(that.satisfiedTypes)``;
                `` indent + indentLevel ``typeParameters = ``transformWithIndent(that.typeParameters)``;
                `` indent + indentLevel ``typeConstraints = ``transformWithIndent(that.typeConstraints)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformIntersectionType(IntersectionType that) => "IntersectionType(``transformWithIndent(that.children)``)";
    transformIntersectAssignmentOperation(IntersectAssignmentOperation that)
            => "IntersectAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``other = ``transformWithIndent(that.other)``;
                ``indent``}";
    transformIntersectionOperation(IntersectionOperation that)
            => "IntersectionOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformInvocation(Invocation that)
            => "Invocation {
                `` indent + indentLevel ``invoked = ``transformWithIndent(that.invoked)``;
                `` indent + indentLevel ``arguments = ``transformWithIndent(that.arguments)``;
                ``indent``}";
    transformInvocationStatement(InvocationStatement that) => "InvocationStatement(``transformWithIndent(that.expression)``)";
    transformIsCase(IsCase that) => "IsCase(``transformWithIndent(that.type)``)";
    transformIsCondition(IsCondition that)
            => "IsCondition {
                `` indent + indentLevel ``variable = ``transformWithIndent(that.variable)``;
                `` indent + indentLevel ``negated = ``that.negated``;
                ``indent``}";
    transformIsOperation(IsOperation that)
            => "IsOperation {
                `` indent + indentLevel ``operand = ``transformWithIndent(that.operand)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                ``indent``}";
    transformIterable(Iterable that) => "Iterable(``transformWithIndent(that.argumentList)``)";
    transformIterableType(IterableType that) => "IterableType(``transformWithIndent(that.variadicType)``)";
    transformKeySubscript(KeySubscript that) => "KeySubscript(``transformWithIndent(that.key)``)";
    transformKeyValueIterator(KeyValueIterator that)
            => "KeyValueIterator {
                `` indent + indentLevel ``keyVariable = ``transformWithIndent(that.keyVariable)``;
                `` indent + indentLevel ``valueVariable = ``transformWithIndent(that.valueVariable)``;
                `` indent + indentLevel ``iterated = ``transformWithIndent(that.iterated)``;
                ``indent``}";
    transformLIdentifier(LIdentifier that)
            => that.usePrefix
            then "LIdentifier(\"``that.name``\", true)"
            else "LIdentifier(\"``that.name``\")";
    transformLazySpecification(LazySpecification that)
            => "LazySpecification {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                `` indent + indentLevel ``parameterLists = ``transformWithIndent(that.parameterLists)``;
                ``indent``}";
    transformLetExpression(LetExpression that)
            => "LetExpression {
                `` indent + indentLevel ``letValues = ``transformWithIndent(that.letValues)``;
                `` indent + indentLevel ``expression = ``transformWithIndent(that.expression)``;
                ``indent``}";
    transformLetValueList(LetValueList that) => "LetValueList(``transformWithIndent(that.letValues)``)";
    transformMatchCase(MatchCase that) => "MatchCase(``transformWithIndent(that.expressions)``)";
    transformMeasureSubscript(MeasureSubscript that)
            => "MeasureSubscript {
                `` indent + indentLevel ``from = ``transformWithIndent(that.from)``;
                `` indent + indentLevel ``length = ``transformWithIndent(that.length)``;
                ``indent``}";
    transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that)
            => that.typeArguments exists
            then "MemberNameWithTypeArguments {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``typeArguments = ``transformWithIndent(that.typeArguments)``;
                  ``indent``}"
            else "MemberNameWithTypeArguments(``transformWithIndent(that.name)``)";
    transformLargeAsOperation(LargeAsOperation that)
            => "LargeAsOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformLargerOperation(LargerOperation that)
            => "LargerOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformLazySpecifier(LazySpecifier that) => "LazySpecifier(``transformWithIndent(that.expression)``)";
    transformMeasureOperation(MeasureOperation that)
            => "MeasureOperation {
                `` indent + indentLevel ``first = ``transformWithIndent(that.first)``;
                `` indent + indentLevel ``size = ``transformWithIndent(that.size)``;
                ``indent``}";
    transformMemberMeta(MemberMeta that)
            => "MemberMeta {
                `` indent + indentLevel ``qualifier = ``transformWithIndent(that.qualifier)``;
                `` indent + indentLevel ``nameAndArgs = ``transformWithIndent(that.nameAndArgs)``;
                ``indent``}";
    transformMemberOperator(MemberOperator that) => "MemberOperator()";
    transformModuleBody(ModuleBody that) => "ModuleBody(``transformWithIndent(that.moduleImports)``)";
    transformModuleCompilationUnit(ModuleCompilationUnit that)
            => "ModuleCompilationUnit {
                `` indent + indentLevel ``moduleDescriptor = ``transformWithIndent(that.moduleDescriptor)``;
                `` indent + indentLevel ``imports = ``transformWithIndent(that.imports)``;
                ``indent``}";
    transformModuleDec(ModuleDec that) => "ModuleDec(``transformWithIndent(that.moduleName)``)";
    transformModuleDescriptor(ModuleDescriptor that)
            => "ModuleDescriptor {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``version = ``transformWithIndent(that.version)``;
                `` indent + indentLevel ``body = ``transformWithIndent(that.body)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformModuleImport(ModuleImport that)
            => "ModuleImport {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``version = ``transformWithIndent(that.version)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that)
            => "MultiplyAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``factor = ``transformWithIndent(that.factor)``;
                ``indent``}";
    transformNamedArguments(NamedArguments that)
            => that.iterableArgument.children nonempty
            then "NamedArguments {
                  `` indent + indentLevel ``namedArguments = ``transformWithIndent(that.namedArguments)``;
                  `` indent + indentLevel ``iterableArgument = ``transformWithIndent(that.iterableArgument)``;
                  ``indent``}"
            else (that.namedArguments nonempty
                then "NamedArguments(``transformWithIndent(that.namedArguments)``)"
                else "NamedArguments()");
    transformNegationOperation(NegationOperation that) => "NegationOperation(``transformWithIndent(that.operand)``)";
    transformNonemptyCondition(NonemptyCondition that) => "NonemptyCondition(``transformWithIndent(that.variable)``)";
    transformNonemptyOperation(NonemptyOperation that) => "NonemptyOperation(``transformWithIndent(that.operand)``)";
    transformNotEqualOperation(NotEqualOperation that)
            => "NotEqualOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformNotOperation(NotOperation that) => "NotOperation(``transformWithIndent(that.operand)``)";
    transformObjectArgument(ObjectArgument that)
            => "ObjectArgument {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``body = ``transformWithIndent(that.body)``;
                `` indent + indentLevel ``extendedType = ``transformWithIndent(that.extendedType)``;
                `` indent + indentLevel ``satisfiedTypes = ``transformWithIndent(that.satisfiedTypes)``;
                ``indent``}";
    transformObjectDefinition(ObjectDefinition that)
            => "ObjectDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``body = ``transformWithIndent(that.body)``;
                `` indent + indentLevel ``extendedType = ``transformWithIndent(that.extendedType)``;
                `` indent + indentLevel ``satisfiedTypes = ``transformWithIndent(that.satisfiedTypes)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformObjectExpression(ObjectExpression that)
            => "ObjectExpression {
                `` indent + indentLevel ``body = ``transformWithIndent(that.body)``;
                `` indent + indentLevel ``extendedType = ``transformWithIndent(that.extendedType)``;
                `` indent + indentLevel ``satisfiedTypes = ``transformWithIndent(that.satisfiedTypes)``;
                ``indent``}";
    transformOfOperation(OfOperation that)
            => "OfOperation {
                `` indent + indentLevel ``operand = ``transformWithIndent(that.operand)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                ``indent``}";
    transformOpenBound(OpenBound that) => "OpenBound(``transformWithIndent(that.endpoint)``)";
    transformOptionalType(OptionalType that) => "OptionalType(``transformWithIndent(that.definiteType)``)";
    transformOrAssignmentOperation(OrAssignmentOperation that)
            => "OrAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``other = ``transformWithIndent(that.other)``;
                ``indent``}";
    transformOrOperation(OrOperation that)
            => "OrOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformOutModifier(OutModifier that) => "OutModifier()";
    transformOuter(Outer that) => "Outer()";
    transformPackage(Package that) => "Package()";
    transformPackageCompilationUnit(PackageCompilationUnit that)
            => "PackageCompilationUnit {
                `` indent + indentLevel ``packageDescriptor = ``transformWithIndent(that.packageDescriptor)``;
                `` indent + indentLevel ``imports = ``transformWithIndent(that.imports)``;
                ``indent``}";
    transformPackageDec(PackageDec that) => "PackageDec(``transformWithIndent(that.packageName)``)";
    transformPackageDescriptor(PackageDescriptor that)
            => "PackageDescriptor {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformParameterReference(ParameterReference that) => "ParameterReference(``transformWithIndent(that.name)``)";
    transformParameters(Parameters that)
            => that.parameters nonempty
            then "Parameters(``transformWithIndent(that.parameters)``)"
            else "Parameters()";
    transformPositionalArguments(PositionalArguments that) => "PositionalArguments(``transformWithIndent(that.argumentList)``)";
    transformPostfixDecrementOperation(PostfixDecrementOperation that) => "PostfixDecrementOperation(``transformWithIndent(that.operand)``)";
    transformPostfixIncrementOperation(PostfixIncrementOperation that) => "PostfixIncrementOperation(``transformWithIndent(that.operand)``)";
    transformPrefixDecrementOperation(PrefixDecrementOperation that) => "PrefixDecrementOperation(``transformWithIndent(that.operand)``)";
    transformPrefixIncrementOperation(PrefixIncrementOperation that) => "PrefixIncrementOperation(``transformWithIndent(that.operand)``)";
    transformPrefixPostfixStatement(PrefixPostfixStatement that) => "PrefixPostfixStatement(``transformWithIndent(that.expression)``)";
    transformProductOperation(ProductOperation that)
            => "ProductOperation {
                `` indent + indentLevel ``leftFactor = ``transformWithIndent(that.leftFactor)``;
                `` indent + indentLevel ``rightFactor = ``transformWithIndent(that.rightFactor)``;
                ``indent``}";
    transformQualifiedExpression(QualifiedExpression that)
            => that.memberOperator is MemberOperator
            then "QualifiedExpression {
                  `` indent + indentLevel ``receiverExpression = ``transformWithIndent(that.receiverExpression)``;
                  `` indent + indentLevel ``nameAndArgs = ``transformWithIndent(that.nameAndArgs)``;
                  ``indent``}"
            else "QualifiedExpression {
                  `` indent + indentLevel ``receiverExpression = ``transformWithIndent(that.receiverExpression)``;
                  `` indent + indentLevel ``nameAndArgs = ``transformWithIndent(that.nameAndArgs)``;
                  `` indent + indentLevel ``memberOperator = ``transformWithIndent(that.memberOperator)``;
                  ``indent``}";
    transformQualifiedType(QualifiedType that)
            => "QualifiedType {
                `` indent + indentLevel ``qualifyingType = ``transformWithIndent(that.qualifyingType)``;
                `` indent + indentLevel ``nameAndArgs = ``transformWithIndent(that.nameAndArgs)``;
                ``indent``}";
    transformQuotientOperation(QuotientOperation that)
            => "QuotientOperation {
                `` indent + indentLevel ``dividend = ``transformWithIndent(that.dividend)``;
                `` indent + indentLevel ``divisor = ``transformWithIndent(that.divisor)``;
                ``indent``}";
    transformRemainderAssignmentOperation(RemainderAssignmentOperation that)
            => "RemainderAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``divisor = ``transformWithIndent(that.divisor)``;
                ``indent``}";
    transformRemainderOperation(RemainderOperation that)
            => "RemainderOperation {
                `` indent + indentLevel ``dividend = ``transformWithIndent(that.dividend)``;
                `` indent + indentLevel ``divisor = ``transformWithIndent(that.divisor)``;
                ``indent``}";
    transformResource(Resource that) => "Resource(``transformWithIndent(that.resource)``)";
    transformResources(Resources that) => "Resources(``transformWithIndent(that.resources)``)";
    transformReturn(Return that)
            => that.result exists
            then "Return(``transformWithIndent(that.result)``)"
            else "Return()";
    transformSafeMemberOperator(SafeMemberOperator that) => "SafeMemberOperator()";
    transformSatisfiedTypes(SatisfiedTypes that) => "SatisfiedTypes(``transformWithIndent(that.satisfiedTypes)``)";
    transformScaleOperation(ScaleOperation that)
            => "ScaleOperation {
                `` indent + indentLevel ``factor = ``transformWithIndent(that.factor)``;
                `` indent + indentLevel ``scalable = ``transformWithIndent(that.scalable)``;
                ``indent``}";
    transformSequentialType(SequentialType that) => "SequentialType(``transformWithIndent(that.elementType)``)";
    transformSmallAsOperation(SmallAsOperation that)
            => "SmallAsOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformSmallerOperation(SmallerOperation that)
            => "SmallerOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformSpanFromSubscript(SpanFromSubscript that) => "SpanFromSubscript(``transformWithIndent(that.from)``)";
    transformSpanOperation(SpanOperation that)
            => "SpanOperation {
                `` indent + indentLevel ``first = ``transformWithIndent(that.first)``;
                `` indent + indentLevel ``last = ``transformWithIndent(that.last)``;
                ``indent``}";
    transformSpanSubscript(SpanSubscript that)
            => "SpanSubscript {
                `` indent + indentLevel ``from = ``transformWithIndent(that.from)``;
                `` indent + indentLevel ``to = ``transformWithIndent(that.to)``;
                ``indent``}";
    transformSpanToSubscript(SpanToSubscript that) => "SpanToSubscript(``transformWithIndent(that.to)``)";
    transformSpecifiedArgument(SpecifiedArgument that) => "SpecifiedArgument(``transformWithIndent(that.specification)``)";
    transformSpecifiedVariable(SpecifiedVariable that)
            => "SpecifiedVariable {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                ``indent``}";
    transformSpecifier(Specifier that) => "Specifier(``transformWithIndent(that.expression)``)";
    transformSpreadArgument(SpreadArgument that) => "SpreadArgument(``transformWithIndent(that.argument)``)";
    transformSpreadMemberOperator(SpreadMemberOperator that) => "SpreadMemberOperator()";
    transformSpreadType(SpreadType that) => "SpreadType(``transformWithIndent(that.type)``)";
    transformStringLiteral(StringLiteral that)
            => that.text.split { '\n'.equals; groupSeparators = false; discardSeparators = true; }.longerThan(1)
            then "StringLiteral(
                  `` indent + indentLevel ``\"\"\"`` that.text.split { '\n'.equals; groupSeparators = false; discardSeparators = true; }.first else "" ````"".join(that.text.split { '\n'.equals; groupSeparators = false; discardSeparators = true; }.rest.collect(("\n" + " ".repeat(indent.size + indentLevel.size + "\"\"\"".size)).plus))``\"\"\"`` that.isVerbatim then ", true" else "" ``)"
            else "StringLiteral(\"\"\"``that.text``\"\"\"`` that.isVerbatim then ", true" else "" ``)";
    transformStringTemplate(StringTemplate that)
            => "StringTemplate {
                `` indent + indentLevel ``literals = ``transformWithIndent(that.literals)``;
                `` indent + indentLevel ``expressions = ``transformWithIndent(that.expressions)``;
                ``indent``}";
    transformSubtractAssignmentOperation(SubtractAssignmentOperation that)
            => "SubtractAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``subtrahend = ``transformWithIndent(that.subtrahend)``;
                ``indent``}";
    transformSumOperation(SumOperation that)
            => "SumOperation {
                `` indent + indentLevel ``leftSummand = ``transformWithIndent(that.leftSummand)``;
                `` indent + indentLevel ``rightSummand = ``transformWithIndent(that.rightSummand)``;
                ``indent``}";
    transformSuper(Super that) => "Super()";
    transformSwitchCaseElse(SwitchCaseElse that)
            => "SwitchCaseElse {
                `` indent + indentLevel ``clause = ``transformWithIndent(that.clause)``;
                `` indent + indentLevel ``cases = ``transformWithIndent(that.cases)``;
                ``indent``}";
    transformSwitchCases(SwitchCases that)
            => "SwitchCases {
                `` indent + indentLevel ``caseClauses = ``transformWithIndent(that.caseClauses)``;
                `` indent + indentLevel ``elseCaseClause = ``transformWithIndent(that.elseCaseClause)``;
                ``indent``}";
    transformSwitchClause(SwitchClause that) => "SwitchClause(``transformWithIndent(that.switched)``)";
    transformThenOperation(ThenOperation that)
            => "ThenOperation {
                `` indent + indentLevel ``condition = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``result = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformThis(This that) => "This()";
    transformThrow(Throw that)
            => that.result exists
            then "Throw(``transformWithIndent(that.result)``)"
            else "Throw()";
    transformTryCatchFinally(TryCatchFinally that)
            => "TryCatchFinally {
                `` indent + indentLevel ``tryClause = ``transformWithIndent(that.tryClause)``;
                `` indent + indentLevel ``catchClauses = ``transformWithIndent(that.catchClauses)``;
                `` indent + indentLevel ``finallyClause = ``transformWithIndent(that.finallyClause)``;
                ``indent``}";
    transformTryClause(TryClause that)
            => "TryClause {
                `` indent + indentLevel ``block = ``transformWithIndent(that.block)``;
                `` indent + indentLevel ``resources = ``transformWithIndent(that.resources)``;
                ``indent``}";
    transformTuple(Tuple that) => "Tuple(``transformWithIndent(that.argumentList)``)";
    transformTupleType(TupleType that) => "TupleType(``transformWithIndent(that.typeList)``)";
    transformTypeAliasDefinition(TypeAliasDefinition that)
            => "TypeAliasDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                `` indent + indentLevel ``typeParameters = ``transformWithIndent(that.typeParameters)``;
                `` indent + indentLevel ``typeConstraints = ``transformWithIndent(that.typeConstraints)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformTypeArgument(TypeArgument that)
            => that.variance exists
            then "TypeArgument {
                  `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                  `` indent + indentLevel ``variance = ``transformWithIndent(that.variance)``;
                  ``indent``}"
            else "TypeArgument(``transformWithIndent(that.type)``)";
    transformTypeArguments(TypeArguments that) => "TypeArguments(``transformWithIndent(that.typeArguments)``)";
    transformTypeConstraint(TypeConstraint that)
            => "TypeConstraint {
                `` indent + indentLevel ``parameterName = ``transformWithIndent(that.parameterName)``;
                `` indent + indentLevel ``caseTypes = ``transformWithIndent(that.caseTypes)``;
                `` indent + indentLevel ``satisfiedTypes = ``transformWithIndent(that.satisfiedTypes)``;
                ``indent``}";
    transformTypeList(TypeList that)
            => that.variadic exists
            then "TypeList {
                  `` indent + indentLevel ``elements = ``transformWithIndent(that.elements)``;
                  `` indent + indentLevel ``variadic = ``transformWithIndent(that.variadic)``;
                  ``indent``}"
            else "TypeList(``transformWithIndent(that.elements)``)";
    transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that)
            => that.typeArguments exists
            then "TypeNameWithTypeArguments {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``typeArguments = ``transformWithIndent(that.typeArguments)``;
                  }"
            else "TypeNameWithTypeArguments(``transformWithIndent(that.name)``)";
    transformTypeMeta(TypeMeta that) => "TypeMeta(``transformWithIndent(that.type)``)";
    transformTypeParameter(TypeParameter that)
            => "TypeParameter {
                `` indent + indentLevel ``parameterName = ``transformWithIndent(that.parameterName)``;
                `` indent + indentLevel ``variance = ``transformWithIndent(that.variance)``;
                `` indent + indentLevel ``defaultArgument = ``transformWithIndent(that.defaultArgument)``;
                ``indent``}";
    transformTypeParameters(TypeParameters that) => "TypeParameters(``transformWithIndent(that.typeParameters)``)";
    transformTypeSpecifier(TypeSpecifier that) => "TypeSpecifier(``transformWithIndent(that.type)``)";
    transformTypedVariable(TypedVariable that)
            => "TypedVariable {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformUIdentifier(UIdentifier that)
            => that.usePrefix
            then "UIdentifier(\"``that.name``\", true)"
            else "UIdentifier(\"``that.name``\")";
    transformUnionType(UnionType that)
            => "UnionType(``transformWithIndent(that.children)``)";
    transformUnionAssignmentOperation(UnionAssignmentOperation that)
            => "UnionAssignmentOperation {
                `` indent + indentLevel ``target = ``transformWithIndent(that.target)``;
                `` indent + indentLevel ``other = ``transformWithIndent(that.other)``;
                ``indent``}";
    transformUnionOperation(UnionOperation that)
            => "UnionOperation {
                `` indent + indentLevel ``leftOperand = ``transformWithIndent(that.leftOperand)``;
                `` indent + indentLevel ``rightOperand = ``transformWithIndent(that.rightOperand)``;
                ``indent``}";
    transformUnspecifiedVariable(UnspecifiedVariable that)
            => that.type exists
            then "UnspecifiedVariable {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                  ``indent``}"
            else "UnspecifiedVariable(``transformWithIndent(that.name)``)";
    transformValueArgument(ValueArgument that)
            => "ValueArgument {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``definition = ``transformWithIndent(that.definition)``;
                ``indent``}";
    transformValueDec(ValueDec that)
            => that.qualifier exists
            then "ValueDec {
                  `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                  `` indent + indentLevel ``qualifier = ``transformWithIndent(that.qualifier)``;
                  ``indent``}"
            else "ValueDec(``transformWithIndent(that.name)``)";
    transformValueDeclaration(ValueDeclaration that)
            => "ValueDeclaration {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformValueDefinition(ValueDefinition that)
            => "ValueDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``definition = ``transformWithIndent(that.definition)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformValueGetterDefinition(ValueGetterDefinition that)
            => "ValueGetterDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``definition = ``transformWithIndent(that.definition)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformValueIterator(ValueIterator that)
            => "ValueIterator {
                `` indent + indentLevel ``variable = ``transformWithIndent(that.variable)``;
                `` indent + indentLevel ``iterated = ``transformWithIndent(that.iterated)``;
                ``indent``}";
    transformValueModifier(ValueModifier that) => "ValueModifier()";
    transformValueParameter(ValueParameter that)
            => "ValueParameter {
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                ``indent``}";
    transformValueSetterDefinition(ValueSetterDefinition that)
            => "ValueSetterDefinition {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``definition = ``transformWithIndent(that.definition)``;
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                ``indent``}";
    transformValueSpecification(ValueSpecification that)
            => "ValueSpecification {
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                `` indent + indentLevel ``specifier = ``transformWithIndent(that.specifier)``;
                ``indent``}";
    transformVariadicParameter(VariadicParameter that)
            => "VariadicParameter {
                `` indent + indentLevel ``annotations = ``transformWithIndent(that.annotations)``;
                `` indent + indentLevel ``type = ``transformWithIndent(that.type)``;
                `` indent + indentLevel ``name = ``transformWithIndent(that.name)``;
                ``indent``}";
    transformVariadicType(VariadicType that)
            => that.isNonempty
            then "VariadicType {
                  `` indent + indentLevel ``elementType = ``transformWithIndent(that.elementType)``;
                  `` indent + indentLevel ``isNonempty = true;
                  ``indent``}"
            else "VariadicType(``transformWithIndent(that.elementType)``)";
    transformVoidModifier(VoidModifier that) => "VoidModifier()";
    transformWhile(While that)
            => "While {
                `` indent + indentLevel ``conditions = ``transformWithIndent(that.conditions)``;
                `` indent + indentLevel ``block = ``transformWithIndent(that.block)``;
                ``indent``}";
    transformWithinOperation(WithinOperation that)
            => "WithinOperation {
                `` indent + indentLevel ``operand = ``transformWithIndent(that.operand)``;
                `` indent + indentLevel ``lowerBound = ``transformWithIndent(that.lowerBound)``;
                `` indent + indentLevel ``upperBound = ``transformWithIndent(that.upperBound)``;
                ``indent``}";
}
