// grep -r '^shared class [[:alpha:]]*(' source/ceylon/ast/core/ | grep -v 'Editor\|Visitor\|Transformer' | sed 's|.*class \([[:alpha:]]*\)(.*|    \1,|' | sort | xclip
import ceylon.ast.core {
    AddAssignmentOperation,
    AliasDec,
    AndAssignmentOperation,
    AndOperation,
    Annotation,
    Annotations,
    AnonymousArgument,
    ArgumentList,
    Assertion,
    AssignmentStatement,
    AssignOperation,
    BaseExpression,
    BaseMeta,
    BaseType,
    Block,
    BooleanCondition,
    Break,
    CallableParameter,
    CallableType,
    CaseClause,
    CaseTypes,
    CatchClause,
    CharacterLiteral,
    ClassAliasDefinition,
    ClassBody,
    ClassDec,
    ClassDefinition,
    ClassInstantiation,
    ClassSpecifier,
    ClosedBound,
    CompareOperation,
    CompilationUnit,
    ComplementAssignmentOperation,
    ComplementOperation,
    Comprehension,
    Conditions,
    Continue,
    DecQualifier,
    DefaultedCallableParameter,
    DefaultedParameterReference,
    DefaultedType,
    DefaultedValueParameter,
    DifferenceOperation,
    DivideAssignmentOperation,
    DynamicBlock,
    DynamicInterfaceDefinition,
    DynamicModifier,
    DynamicValue,
    ElementOrSubrangeExpression,
    ElseCaseClause,
    ElseClause,
    ElseOperation,
    EntryOperation,
    EntryType,
    EqualOperation,
    ExistsCondition,
    ExistsOperation,
    ExponentiationOperation,
    ExpressionComprehensionClause,
    ExtendedType,
    FailClause,
    FinallyClause,
    FloatLiteral,
    ForClause,
    ForComprehensionClause,
    ForFail,
    FullPackageName,
    FunctionArgument,
    FunctionDec,
    FunctionDeclaration,
    FunctionDefinition,
    FunctionExpression,
    FunctionModifier,
    FunctionShortcutDefinition,
    GivenDec,
    GroupedExpression,
    GroupedType,
    IdenticalOperation,
    IdentityOperation,
    IfClause,
    IfComprehensionClause,
    IfElse,
    Import,
    ImportElements,
    ImportFunctionValueAlias,
    ImportFunctionValueElement,
    ImportTypeAlias,
    ImportTypeElement,
    ImportWildcard,
    InModifier,
    InOperation,
    IntegerLiteral,
    InterfaceAliasDefinition,
    InterfaceBody,
    InterfaceDec,
    InterfaceDefinition,
    IntersectAssignmentOperation,
    IntersectionOperation,
    IntersectionType,
    Invocation,
    InvocationStatement,
    IsCase,
    IsCondition,
    IsOperation,
    Iterable,
    IterableType,
    KeySubscript,
    KeyValueIterator,
    LargeAsOperation,
    LargerOperation,
    LazySpecification,
    LazySpecifier,
    LetExpression,
    LetValueList,
    LIdentifier,
    MatchCase,
    MeasureOperation,
    MeasureSubscript,
    MemberMeta,
    MemberNameWithTypeArguments,
    ModuleDec,
    MultiplyAssignmentOperation,
    NamedArguments,
    NegationOperation,
    NonemptyCondition,
    NonemptyOperation,
    NotEqualOperation,
    NotOperation,
    ObjectArgument,
    ObjectDefinition,
    ObjectExpression,
    OfOperation,
    OpenBound,
    OptionalType,
    OrAssignmentOperation,
    OrOperation,
    Outer,
    OutModifier,
    Package,
    PackageDec,
    ParameterReference,
    Parameters,
    PositionalArguments,
    PostfixDecrementOperation,
    PostfixIncrementOperation,
    PrefixDecrementOperation,
    PrefixIncrementOperation,
    PrefixPostfixStatement,
    ProductOperation,
    QualifiedExpression,
    QualifiedType,
    QuotientOperation,
    RemainderAssignmentOperation,
    RemainderOperation,
    Resource,
    Resources,
    Return,
    SafeMemberOperator,
    SatisfiedTypes,
    ScaleOperation,
    SequentialType,
    SmallAsOperation,
    SmallerOperation,
    SpanFromSubscript,
    SpanOperation,
    SpanSubscript,
    SpanToSubscript,
    SpecifiedArgument,
    SpecifiedVariable,
    Specifier,
    SpreadArgument,
    SpreadMemberOperator,
    SpreadType,
    StringLiteral,
    StringTemplate,
    SubtractAssignmentOperation,
    SumOperation,
    Super,
    SwitchCaseElse,
    SwitchCases,
    SwitchClause,
    ThenOperation,
    This,
    Throw,
    TryCatchFinally,
    TryClause,
    Tuple,
    TupleType,
    TypeAliasDefinition,
    TypeArgument,
    TypeArguments,
    TypeConstraint,
    TypedVariable,
    TypeList,
    TypeMeta,
    TypeNameWithTypeArguments,
    TypeParameter,
    TypeParameters,
    TypeSpecifier,
    UIdentifier,
    UnionAssignmentOperation,
    UnionOperation,
    UnionType,
    UnspecifiedVariable,
    ValueArgument,
    ValueDec,
    ValueDeclaration,
    ValueDefinition,
    ValueGetterDefinition,
    ValueIterator,
    ValueModifier,
    ValueParameter,
    ValueSetterDefinition,
    ValueSpecification,
    VariadicParameter,
    VariadicType,
    VoidModifier,
    While,
    WithinOperation
}

"A compilation unit node containing every AST node that can be a child of a regular compilation unit
 (that is, all nodes except those exclusively for module or package descriptors).
 
 If you’re looking at its source code: **This is not how you *should* write your nodes.**
 This node’s original purpose was to test [[ceylon.ast.core::CeylonExpressionTransformer]]:
 If you read the source file, everything between the `BEGIN` and `END` comments
 is (trimmed) the exact output of `completeCompilationUnit.transform(CeylonExpressionTransformer())`.
 For this reason, it is very verbose, using no utility functions, but only occasionally
 omitting defaulted arguments.
 
 Its main use is to test `ceylon.ast` transformers and consumers that need to be able to handle
 every kind of node. Of course, it doesn’t contain each possible configuration of every node type
 (there is, for example, no `else if`)."
shared CompilationUnit completeCompilationUnit
        = /* BEGIN */ CompilationUnit {
    imports = [
        Import {
            packageName = FullPackageName([
                    LIdentifier("java"),
                    LIdentifier("lang")
                ]);
            elements = ImportElements {
                elements = [
                    ImportTypeElement {
                        name = UIdentifier("System");
                        importAlias = ImportTypeAlias(UIdentifier("Sys"));
                        nestedImports = ImportElements {
                            elements = [
                                ImportFunctionValueElement {
                                    name = LIdentifier("out", true);
                                    importAlias = ImportFunctionValueAlias(LIdentifier("sysout"));
                                    nestedImports = null;
                                }
                            ];
                            wildcard = null;
                        };
                    }
                ];
                wildcard = ImportWildcard();
            };
        }
    ];
    declarations = [
        FunctionDefinition {
            name = LIdentifier("run");
            type = VoidModifier();
            parameterLists = [Parameters()];
            definition = Block([
                    InvocationStatement(Invocation {
                            invoked = QualifiedExpression {
                                receiverExpression = BaseExpression(MemberNameWithTypeArguments(LIdentifier("sysout")));
                                nameAndArgs = MemberNameWithTypeArguments(LIdentifier("println"));
                            };
                            arguments = PositionalArguments(ArgumentList([StringLiteral("""Hello, World!""")]));
                        }),
                    Return()
                ]);
            typeParameters = null;
            typeConstraints = [];
            annotations = Annotations {
                anonymousAnnotation = StringLiteral(
                    """The run function.
                       
                       Prints “Hello, World!”.""");
                annotations = [Annotation(LIdentifier("shared"))];
            };
        },
        ClassDefinition {
            name = UIdentifier("MyBoolean");
            parameters = Parameters([
                    ValueParameter {
                        annotations = Annotations {
                            annotations = [
                                Annotation(LIdentifier("shared")),
                                Annotation(LIdentifier("actual"))
                            ];
                        };
                        type = BaseType(TypeNameWithTypeArguments(UIdentifier("String")));
                        name = LIdentifier("string");
                    }
                ]);
            body = ClassBody([
                    TryCatchFinally {
                        tryClause = TryClause {
                            block = Block([Throw()]);
                            resources = Resources([
                                    Resource(SpecifiedVariable {
                                            name = LIdentifier("w");
                                            specifier = Specifier(BaseExpression(MemberNameWithTypeArguments(LIdentifier("wr"))));
                                            type = ValueModifier();
                                        })
                                ]);
                        };
                        catchClauses = [
                            CatchClause {
                                variable = UnspecifiedVariable {
                                    name = LIdentifier("t");
                                    type = BaseType(TypeNameWithTypeArguments(UIdentifier("Throwable")));
                                };
                                block = Block([]);
                            }
                        ];
                        finallyClause = FinallyClause(Block([]));
                    },
                    Assertion {
                        conditions = Conditions([
                                IsCondition {
                                    variable = TypedVariable {
                                        name = LIdentifier("arg1");
                                        type = BaseType(TypeNameWithTypeArguments(UIdentifier("String")));
                                        specifier = null;
                                    };
                                    negated = false;
                                },
                                ExistsCondition(SpecifiedVariable {
                                        name = LIdentifier("arg2");
                                        specifier = Specifier(ElementOrSubrangeExpression {
                                                primary = QualifiedExpression {
                                                    receiverExpression = BaseExpression(MemberNameWithTypeArguments(LIdentifier("arg1")));
                                                    nameAndArgs = MemberNameWithTypeArguments(LIdentifier("uppercased"));
                                                    memberOperator = SpreadMemberOperator();
                                                };
                                                subscript = SpanToSubscript(IntegerLiteral("65536"));
                                            });
                                        type = null;
                                    }),
                                NonemptyCondition(LIdentifier("arg2")),
                                BooleanCondition(NotOperation(NonemptyOperation(BaseExpression(MemberNameWithTypeArguments(LIdentifier("arg1"))))))
                            ]);
                        annotations = Annotations();
                    },
                    ValueDefinition {
                        name = LIdentifier("metas");
                        type = ValueModifier();
                        definition = Specifier(Iterable(ArgumentList([
                                        TypeMeta(IntersectionType([
                                                    BaseType(TypeNameWithTypeArguments(UIdentifier("Identifiable"))),
                                                    BaseType(TypeNameWithTypeArguments(UIdentifier("Usable")))
                                                ])),
                                        BaseMeta(MemberNameWithTypeArguments(LIdentifier("process"))),
                                        MemberMeta {
                                            qualifier = LIdentifier("process");
                                            nameAndArgs = MemberNameWithTypeArguments(LIdentifier("arguments"));
                                        }
                                    ])));
                        annotations = Annotations();
                    },
                    ValueDefinition {
                        name = LIdentifier("decs");
                        type = ValueModifier();
                        definition = Specifier(Tuple(ArgumentList([
                                        ClassDec(UIdentifier("String")),
                                        InterfaceDec(UIdentifier("Iterable")),
                                        AliasDec(UIdentifier("AddingExpression")),
                                        GivenDec(UIdentifier("Element")),
                                        ValueDec {
                                            name = LIdentifier("arguments");
                                            qualifier = DecQualifier([LIdentifier("process")]);
                                        },
                                        FunctionDec(LIdentifier("print")),
                                        PackageDec(FullPackageName([LIdentifier("tmp")])),
                                        ModuleDec(FullPackageName([LIdentifier("tmp")]))
                                    ])));
                        annotations = Annotations();
                    },
                    ValueDefinition {
                        name = LIdentifier("operations");
                        type = ValueModifier();
                        definition = Specifier(ElseOperation {
                                optionalValue = ThenOperation {
                                    condition = OrOperation {
                                        leftOperand = AndOperation {
                                            leftOperand = NotOperation(EqualOperation {
                                                    leftOperand = IsOperation {
                                                        operand = ExistsOperation(SpanOperation {
                                                                first = SumOperation {
                                                                    leftSummand = ScaleOperation {
                                                                        factor = ProductOperation {
                                                                            leftFactor = UnionOperation {
                                                                                leftOperand = IntersectionOperation {
                                                                                    leftOperand = IdentityOperation(ExponentiationOperation {
                                                                                            base = PrefixIncrementOperation(IntegerLiteral("0"));
                                                                                            exponent = PrefixDecrementOperation(IntegerLiteral("0"));
                                                                                        });
                                                                                    rightOperand = NegationOperation(PostfixIncrementOperation(IntegerLiteral("0")));
                                                                                };
                                                                                rightOperand = PostfixDecrementOperation(IntegerLiteral("0"));
                                                                            };
                                                                            rightFactor = ComplementOperation {
                                                                                leftOperand = IntegerLiteral("0");
                                                                                rightOperand = IntegerLiteral("0");
                                                                            };
                                                                        };
                                                                        scalable = QuotientOperation {
                                                                            dividend = IntegerLiteral("0");
                                                                            divisor = IntegerLiteral("0");
                                                                        };
                                                                    };
                                                                    rightSummand = RemainderOperation {
                                                                        dividend = IntegerLiteral("0");
                                                                        divisor = IntegerLiteral("0");
                                                                    };
                                                                };
                                                                last = DifferenceOperation {
                                                                    minuend = IntegerLiteral("0");
                                                                    subtrahend = IntegerLiteral("0");
                                                                };
                                                            });
                                                        type = BaseType(TypeNameWithTypeArguments(UIdentifier("String")));
                                                    };
                                                    rightOperand = OfOperation {
                                                        operand = NonemptyOperation(MeasureOperation {
                                                                first = IntegerLiteral("0");
                                                                size = IntegerLiteral("0");
                                                            });
                                                        type = BaseType(TypeNameWithTypeArguments(UIdentifier("String")));
                                                    };
                                                });
                                            rightOperand = InOperation {
                                                element = EntryOperation {
                                                    key = IntegerLiteral("0");
                                                    item = IntegerLiteral("0");
                                                };
                                                category = IntegerLiteral("0");
                                            };
                                        };
                                        rightOperand = NotEqualOperation {
                                            leftOperand = LargerOperation {
                                                leftOperand = IntegerLiteral("0");
                                                rightOperand = IntegerLiteral("0");
                                            };
                                            rightOperand = SmallerOperation {
                                                leftOperand = IntegerLiteral("0");
                                                rightOperand = IntegerLiteral("0");
                                            };
                                        };
                                    };
                                    result = IdenticalOperation {
                                        leftOperand = LargeAsOperation {
                                            leftOperand = IntegerLiteral("0");
                                            rightOperand = IntegerLiteral("0");
                                        };
                                        rightOperand = SmallAsOperation {
                                            leftOperand = IntegerLiteral("0");
                                            rightOperand = IntegerLiteral("0");
                                        };
                                    };
                                };
                                defaultValue = EqualOperation {
                                    leftOperand = CompareOperation {
                                        leftOperand = IntegerLiteral("0");
                                        rightOperand = IntegerLiteral("0");
                                    };
                                    rightOperand = WithinOperation {
                                        operand = IntegerLiteral("0");
                                        lowerBound = ClosedBound(IntegerLiteral("0"));
                                        upperBound = OpenBound(IntegerLiteral("0"));
                                    };
                                };
                            });
                        annotations = Annotations();
                    },
                    ValueDefinition {
                        name = LIdentifier("assignments");
                        type = ValueModifier();
                        definition = Specifier(AssignOperation {
                                target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                expression = AddAssignmentOperation {
                                    target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                    summand = SubtractAssignmentOperation {
                                        target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                        subtrahend = MultiplyAssignmentOperation {
                                            target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                            factor = DivideAssignmentOperation {
                                                target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                                divisor = RemainderAssignmentOperation {
                                                    target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                                    divisor = IntersectAssignmentOperation {
                                                        target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                                        other = UnionAssignmentOperation {
                                                            target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                                            other = ComplementAssignmentOperation {
                                                                target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                                                other = AndAssignmentOperation {
                                                                    target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                                                    other = OrAssignmentOperation {
                                                                        target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                                                        other = BaseExpression(MemberNameWithTypeArguments(LIdentifier("v")));
                                                                    };
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            });
                        annotations = Annotations();
                    },
                    While {
                        conditions = Conditions([BooleanCondition(BaseExpression(MemberNameWithTypeArguments(LIdentifier("true"))))]);
                        block = Block([Break()]);
                    },
                    ForFail {
                        forClause = ForClause {
                            iterator = KeyValueIterator {
                                keyVariable = UnspecifiedVariable(LIdentifier("k"));
                                valueVariable = UnspecifiedVariable(LIdentifier("v"));
                                iterated = BaseExpression(MemberNameWithTypeArguments(LIdentifier("kvs")));
                            };
                            block = Block([Continue()]);
                        };
                        failClause = FailClause(Block([]));
                    },
                    ValueDefinition {
                        name = LIdentifier("comprehension");
                        type = ValueModifier();
                        definition = Specifier(Iterable(ArgumentList {
                                    listedArguments = [];
                                    sequenceArgument = Comprehension(ForComprehensionClause {
                                            iterator = ValueIterator {
                                                variable = UnspecifiedVariable(LIdentifier("v"));
                                                iterated = BaseExpression(MemberNameWithTypeArguments(LIdentifier("vs")));
                                            };
                                            clause = IfComprehensionClause {
                                                conditions = Conditions([BooleanCondition(BaseExpression(MemberNameWithTypeArguments(LIdentifier("c"))))]);
                                                clause = ExpressionComprehensionClause(LetExpression {
                                                        letValues = LetValueList([
                                                                SpecifiedVariable {
                                                                    name = LIdentifier("w");
                                                                    specifier = Specifier(BaseExpression(MemberNameWithTypeArguments(LIdentifier("v"))));
                                                                    type = null;
                                                                }
                                                            ]);
                                                        expression = BaseExpression(MemberNameWithTypeArguments(LIdentifier("w")));
                                                    });
                                            };
                                        });
                                }));
                        annotations = Annotations();
                    },
                    ValueDefinition {
                        name = LIdentifier("spread");
                        type = ValueModifier();
                        definition = Specifier(Iterable(ArgumentList {
                                    listedArguments = [];
                                    sequenceArgument = SpreadArgument(BaseExpression(MemberNameWithTypeArguments(LIdentifier("vs"))));
                                }));
                        annotations = Annotations();
                    },
                    InvocationStatement(Invocation {
                            invoked = BaseExpression(MemberNameWithTypeArguments(LIdentifier("namedArguments")));
                            arguments = NamedArguments([
                                    AnonymousArgument(IntegerLiteral("0")),
                                    SpecifiedArgument(ValueSpecification {
                                            name = LIdentifier("specifiedArgument");
                                            specifier = Specifier(IntegerLiteral("0"));
                                        }),
                                    SpecifiedArgument(LazySpecification {
                                            name = LIdentifier("lazySpecifiedArgument");
                                            specifier = LazySpecifier(IntegerLiteral("0"));
                                            parameterLists = [];
                                        }),
                                    ValueArgument {
                                        name = LIdentifier("valueArgument");
                                        type = ValueModifier();
                                        definition = Specifier(IntegerLiteral("0"));
                                    },
                                    FunctionArgument {
                                        name = LIdentifier("functionArgument");
                                        type = FunctionModifier();
                                        parameterLists = [Parameters()];
                                        definition = LazySpecifier(IntegerLiteral("0"));
                                    },
                                    ObjectArgument {
                                        name = LIdentifier("objectArgument");
                                        body = ClassBody([]);
                                        extendedType = null;
                                        satisfiedTypes = null;
                                    }
                                ]);
                        }),
                    AssignmentStatement(AddAssignmentOperation {
                            target = BaseExpression(MemberNameWithTypeArguments(LIdentifier("i")));
                            summand = IntegerLiteral("0");
                        }),
                    PrefixPostfixStatement(PostfixIncrementOperation(BaseExpression(MemberNameWithTypeArguments(LIdentifier("i"))))),
                    FunctionDeclaration {
                        name = LIdentifier("functionDeclaration");
                        type = VoidModifier();
                        parameterLists = [
                            Parameters([
                                    ValueParameter {
                                        annotations = Annotations();
                                        type = DynamicModifier();
                                        name = LIdentifier("valueParameter");
                                    },
                                    CallableParameter {
                                        annotations = Annotations();
                                        type = VoidModifier();
                                        name = LIdentifier("callableParameter");
                                        parameterLists = [Parameters()];
                                    },
                                    ParameterReference(LIdentifier("parameterReference")),
                                    DefaultedValueParameter {
                                        parameter = ValueParameter {
                                            annotations = Annotations();
                                            type = DynamicModifier();
                                            name = LIdentifier("defaultedValueParameter");
                                        };
                                        specifier = Specifier(IntegerLiteral("0"));
                                    },
                                    DefaultedCallableParameter {
                                        parameter = CallableParameter {
                                            annotations = Annotations();
                                            type = VoidModifier();
                                            name = LIdentifier("defaultedCallableParameter");
                                            parameterLists = [Parameters()];
                                        };
                                        specifier = LazySpecifier(IntegerLiteral("0"));
                                    },
                                    DefaultedParameterReference {
                                        parameter = ParameterReference(LIdentifier("defaultedParameterReference"));
                                        specifier = Specifier(IntegerLiteral("0"));
                                    },
                                    VariadicParameter {
                                        annotations = Annotations();
                                        type = VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"))));
                                        name = LIdentifier("variadicParameter");
                                    }
                                ])
                        ];
                        typeParameters = null;
                        typeConstraints = [];
                        annotations = Annotations();
                    },
                    ValueDefinition {
                        name = LIdentifier("literals");
                        type = ValueModifier();
                        definition = Specifier(Iterable(ArgumentList([
                                        StringLiteral("""String literal"""),
                                        StringLiteral("""Verbatim string literal""", true),
                                        CharacterLiteral("""c"""),
                                        IntegerLiteral("0"),
                                        FloatLiteral("0.0")
                                    ])));
                        annotations = Annotations();
                    },
                    IfElse {
                        ifClause = IfClause {
                            conditions = Conditions([BooleanCondition(BaseExpression(MemberNameWithTypeArguments(LIdentifier("ifElse"))))]);
                            block = Block([]);
                        };
                        elseClause = ElseClause(Block([]));
                    },
                    SwitchCaseElse {
                        clause = SwitchClause(BaseExpression(MemberNameWithTypeArguments(LIdentifier("switchCaseElse"))));
                        cases = SwitchCases {
                            caseClauses = [
                                CaseClause {
                                    caseItem = MatchCase([IntegerLiteral("0")]);
                                    block = Block([]);
                                },
                                CaseClause {
                                    caseItem = IsCase(BaseType(TypeNameWithTypeArguments(UIdentifier("String"))));
                                    block = Block([]);
                                }
                            ];
                            elseCaseClause = ElseCaseClause(Block([]));
                        };
                    },
                    SwitchCaseElse {
                        clause = SwitchClause(SpecifiedVariable {
                                name = LIdentifier("switchVariable");
                                specifier = Specifier(BaseExpression(MemberNameWithTypeArguments(LIdentifier("switchVariableExpression"))));
                                type = ValueModifier();
                            });
                        cases = SwitchCases {
                            caseClauses = [
                                CaseClause {
                                    caseItem = MatchCase([IntegerLiteral("0")]);
                                    block = Block([]);
                                },
                                CaseClause {
                                    caseItem = IsCase(BaseType(TypeNameWithTypeArguments(UIdentifier("String"))));
                                    block = Block([]);
                                }
                            ];
                            elseCaseClause = ElseCaseClause(Block([]));
                        };
                    },
                    DynamicBlock(Block([])),
                    ValueDefinition {
                        name = LIdentifier("subscripts");
                        type = ValueModifier();
                        definition = Specifier(Iterable(ArgumentList([
                                        ElementOrSubrangeExpression {
                                            primary = IntegerLiteral("0");
                                            subscript = KeySubscript(IntegerLiteral("0"));
                                        },
                                        ElementOrSubrangeExpression {
                                            primary = IntegerLiteral("0");
                                            subscript = SpanSubscript {
                                                from = IntegerLiteral("0");
                                                to = IntegerLiteral("0");
                                            };
                                        },
                                        ElementOrSubrangeExpression {
                                            primary = IntegerLiteral("0");
                                            subscript = MeasureSubscript {
                                                from = IntegerLiteral("0");
                                                length = IntegerLiteral("0");
                                            };
                                        },
                                        ElementOrSubrangeExpression {
                                            primary = IntegerLiteral("0");
                                            subscript = SpanFromSubscript(IntegerLiteral("0"));
                                        },
                                        ElementOrSubrangeExpression {
                                            primary = IntegerLiteral("0");
                                            subscript = SpanToSubscript(IntegerLiteral("0"));
                                        }
                                    ])));
                        annotations = Annotations();
                    },
                    ValueDeclaration {
                        name = LIdentifier("valueDeclaration");
                        type = DynamicModifier();
                        annotations = Annotations();
                    },
                    ValueGetterDefinition {
                        name = LIdentifier("valueGetterDefinition");
                        type = ValueModifier();
                        definition = Block([]);
                        annotations = Annotations();
                    },
                    ValueSetterDefinition {
                        name = LIdentifier("valueSetterDefinition");
                        definition = Block([]);
                        annotations = Annotations();
                    },
                    ValueDefinition {
                        name = LIdentifier("selfReferences");
                        type = ValueModifier();
                        definition = Specifier(Iterable(ArgumentList([
                                        QualifiedExpression {
                                            receiverExpression = This();
                                            nameAndArgs = MemberNameWithTypeArguments(LIdentifier("thisReference"));
                                        },
                                        QualifiedExpression {
                                            receiverExpression = Super();
                                            nameAndArgs = MemberNameWithTypeArguments(LIdentifier("superReference"));
                                        },
                                        QualifiedExpression {
                                            receiverExpression = Outer();
                                            nameAndArgs = MemberNameWithTypeArguments(LIdentifier("outerReference"));
                                            memberOperator = SafeMemberOperator();
                                        },
                                        QualifiedExpression {
                                            receiverExpression = Package();
                                            nameAndArgs = MemberNameWithTypeArguments(LIdentifier("packageReference"));
                                            memberOperator = SpreadMemberOperator();
                                        }
                                    ])));
                        annotations = Annotations();
                    },
                    InterfaceDefinition {
                        name = UIdentifier("Interface");
                        body = InterfaceBody([]);
                        caseTypes = null;
                        satisfiedTypes = null;
                        typeParameters = null;
                        typeConstraints = [];
                        annotations = Annotations();
                    },
                    DynamicInterfaceDefinition {
                        name = UIdentifier("DynamicInterface");
                        body = InterfaceBody([]);
                        caseTypes = null;
                        satisfiedTypes = null;
                        typeParameters = null;
                        typeConstraints = [];
                        annotations = Annotations();
                    },
                    ObjectDefinition {
                        name = LIdentifier("objectDefinition");
                        body = ClassBody([]);
                        extendedType = null;
                        satisfiedTypes = null;
                        annotations = Annotations();
                    },
                    ValueDefinition {
                        name = LIdentifier("miscExpressions");
                        type = ValueModifier();
                        definition = Specifier(Iterable(ArgumentList([
                                        GroupedExpression(FunctionExpression {
                                                parameterLists = [Parameters()];
                                                definition = LazySpecifier(DynamicValue {
                                                        namedArguments = [];
                                                        iterableArgument = ArgumentList([]);
                                                        modifier = DynamicModifier();
                                                    });
                                                type = null;
                                            }),
                                        StringTemplate {
                                            literals = [
                                                StringLiteral("""Hello, """),
                                                StringLiteral("""!""")
                                            ];
                                            expressions = [IntegerLiteral("0")];
                                        }
                                    ])));
                        annotations = Annotations();
                    },
                    ValueDefinition {
                        name = LIdentifier("objectExpression");
                        type = ValueModifier();
                        definition = Specifier(ObjectExpression {
                                body = ClassBody([]);
                                extendedType = ExtendedType(ClassInstantiation {
                                        name = TypeNameWithTypeArguments(UIdentifier("Object"));
                                        arguments = PositionalArguments(ArgumentList([]));
                                        qualifier = null;
                                    });
                                satisfiedTypes = SatisfiedTypes([BaseType(TypeNameWithTypeArguments(UIdentifier("Identifiable")))]);
                            });
                        annotations = Annotations();
                    }
                ]);
            caseTypes = CaseTypes([
                    LIdentifier("myTrue"),
                    LIdentifier("myFalse")
                ]);
            extendedType = ExtendedType(ClassInstantiation {
                    name = TypeNameWithTypeArguments(UIdentifier("Object"));
                    arguments = PositionalArguments(ArgumentList([]));
                    qualifier = null;
                });
            satisfiedTypes = SatisfiedTypes([BaseType(TypeNameWithTypeArguments(UIdentifier("MyObject")))]);
            typeParameters = null;
            typeConstraints = [];
            annotations = Annotations {
                annotations = [Annotation(LIdentifier("shared"))];
            };
        },
        ClassAliasDefinition {
            name = UIdentifier("B");
            parameters = Parameters();
            specifier = ClassSpecifier(ClassInstantiation {
                    name = TypeNameWithTypeArguments(UIdentifier("MyBoolean"));
                    arguments = PositionalArguments(ArgumentList([]));
                    qualifier = null;
                });
            caseTypes = null;
            extendedType = null;
            satisfiedTypes = null;
            typeParameters = null;
            typeConstraints = [];
            annotations = Annotations();
        },
        InterfaceAliasDefinition {
            name = UIdentifier("Strings");
            specifier = TypeSpecifier(IterableType(VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"))))));
            caseTypes = null;
            satisfiedTypes = null;
            typeParameters = null;
            typeConstraints = [];
            annotations = Annotations();
        },
        TypeAliasDefinition {
            name = UIdentifier("Primitive");
            specifier = TypeSpecifier(UnionType([
                        BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))),
                        BaseType(TypeNameWithTypeArguments(UIdentifier("Float"))),
                        BaseType(TypeNameWithTypeArguments(UIdentifier("Boolean"))),
                        OptionalType(BaseType(TypeNameWithTypeArguments(UIdentifier("Character"))))
                    ]));
            typeParameters = null;
            typeConstraints = [];
            annotations = Annotations();
        },
        FunctionShortcutDefinition {
            name = LIdentifier("genericLoop");
            type = FunctionModifier();
            parameterLists = [
                Parameters([
                        DefaultedValueParameter {
                            parameter = ValueParameter {
                                annotations = Annotations();
                                type = DynamicModifier();
                                name = LIdentifier("param");
                            };
                            specifier = Specifier(Tuple(ArgumentList([])));
                        }
                    ])
            ];
            definition = LazySpecifier(Invocation {
                    invoked = BaseExpression(MemberNameWithTypeArguments {
                            name = LIdentifier("genericLoop");
                            typeArguments = TypeArguments([
                                    TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("TParam1")))),
                                    TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("TParam2")))),
                                    TypeArgument {
                                        type = BaseType(TypeNameWithTypeArguments(UIdentifier("TParam3")));
                                        variance = InModifier();
                                    },
                                    TypeArgument {
                                        type = BaseType(TypeNameWithTypeArguments(UIdentifier("TParam4")));
                                        variance = OutModifier();
                                    }
                                ]);
                        });
                    arguments = PositionalArguments(ArgumentList([]));
                });
            typeParameters = TypeParameters([
                    TypeParameter {
                        parameterName = UIdentifier("TParam1");
                        variance = InModifier();
                        defaultArgument = EntryType {
                            key = BaseType(TypeNameWithTypeArguments(UIdentifier("String")));
                            item = BaseType(TypeNameWithTypeArguments(UIdentifier("Integer")));
                        };
                    },
                    TypeParameter {
                        parameterName = UIdentifier("TParam2");
                        variance = OutModifier();
                        defaultArgument = CallableType {
                            returnType = BaseType(TypeNameWithTypeArguments(UIdentifier("Anything")));
                            argumentTypes = TypeList([]);
                        };
                    },
                    TypeParameter {
                        parameterName = UIdentifier("TParam3");
                        variance = null;
                        defaultArgument = CallableType {
                            returnType = BaseType(TypeNameWithTypeArguments(UIdentifier("Ret")));
                            argumentTypes = SpreadType(BaseType(TypeNameWithTypeArguments(UIdentifier("Args"))));
                        };
                    },
                    TypeParameter {
                        parameterName = UIdentifier("TParam4");
                        variance = null;
                        defaultArgument = CallableType {
                            returnType = BaseType(TypeNameWithTypeArguments(UIdentifier("Anything")));
                            argumentTypes = TypeList([]);
                        };
                    }
                ]);
            typeConstraints = [
                TypeConstraint {
                    parameterName = UIdentifier("TParam1");
                    caseTypes = CaseTypes([
                            BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))),
                            BaseType(TypeNameWithTypeArguments(UIdentifier("Float")))
                        ]);
                    satisfiedTypes = null;
                },
                TypeConstraint {
                    parameterName = UIdentifier("TParam2");
                    caseTypes = null;
                    satisfiedTypes = SatisfiedTypes([
                            TupleType(TypeList([
                                        BaseType(TypeNameWithTypeArguments(UIdentifier("Anything"))),
                                        DefaultedType(BaseType(TypeNameWithTypeArguments(UIdentifier("Anything"))))
                                    ])),
                            SequentialType(GroupedType(QualifiedType {
                                        qualifyingType = BaseType(TypeNameWithTypeArguments(UIdentifier("Outer")));
                                        nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Inner"));
                                    }))
                        ]);
                }
            ];
            annotations = Annotations();
        }
    ];
} /* END */;
