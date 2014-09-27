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
    LIdentifier,
    MatchCase,
    MeasureOperation,
    MeasureSubscript,
    MemberMeta,
    MemberNameWithTypeArguments,
    MemberOperator,
    ModuleBody,
    ModuleCompilationUnit,
    ModuleDec,
    ModuleDescriptor,
    ModuleImport,
    MultiplyAssignmentOperation,
    NamedArguments,
    NegationOperation,
    NonemptyCondition,
    NonemptyOperation,
    NotEqualOperation,
    NotOperation,
    ObjectArgument,
    ObjectDefinition,
    OfOperation,
    OpenBound,
    OperatorStyleInvocation,
    OperatorStyleMemberExpression,
    OptionalType,
    OrAssignmentOperation,
    OrOperation,
    Outer,
    OutModifier,
    Package,
    PackageCompilationUnit,
    PackageDec,
    PackageDescriptor,
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
 (that is, all nodes except those exclusively for module or package descriptors)."
// TODO expand until there are no more unused import warnings
CompilationUnit completeCompilationUnit
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
                        })
                ]);
            typeParameters = null;
            typeConstraints = [];
            annotations = Annotations {
                anonymousAnnotation = StringLiteral("""The run function.""");
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
            body = ClassBody([]);
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
                                    TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("TParam2"))))
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
