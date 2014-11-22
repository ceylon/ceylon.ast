import ceylon.ast.core {
    BaseType,
    ClassBody,
    ClassDefinition,
    CompilationUnit,
    FunctionDefinition,
    InterfaceDefinition,
    IntersectionType,
    LIdentifier,
    ObjectDefinition,
    OutModifier,
    Return,
    TypeAliasDefinition,
    TypeConstraint,
    TypeParameter,
    TypeSpecifier,
    UIdentifier,
    UnionType,
    ValueDeclaration,
    ValueParameter
}
import ceylon.ast.create {
    annotations,
    baseExpression,
    baseType,
    caseTypes,
    classDefinition,
    extendedType,
    functionDefinition,
    interfaceDefinition,
    satisfiedTypes
}
import ceylon.collection {
    SingletonSet
}

shared abstract class Movement(shared actual String string)
        of left | none | right {}
shared object left extends Movement("left") {}
shared object none extends Movement("none") {}
shared object right extends Movement("right") {}

"Creates the components of the type system Turing machine."
shared class TuringMachineCreator(
    states,
    symbols,
    inputSymbols,
    initialState,
    acceptingStates,
    "Optionally: Descriptions for the states."
    String? stateDescription(String state) => null,
    "Optionally: Descriptions for the symbols."
    String? symbolDescription(Character symbol) => null) {
    
    "The set of states in which the turing machine can be."
    Set<String> states;
    "The set of symbols that can be written onto the tape (excluding the blank symbol)."
    Set<Character> symbols;
    "The set of symbols that can be on the tape initially. Must be a subset of [[symbols]]."
    Set<Character> inputSymbols;
    "The initial state. Must be an element of [[states]]."
    String initialState;
    "The accepting states. Must be a subset of [[states]]."
    Set<String> acceptingStates;
    
    "Must have at least one accepting state"
    assert (nonempty acceptingStates_seq = acceptingStates.sequence());
    
    "Input symbols must be valid symsols"
    assert (inputSymbols.subset(symbols));
    "Initial state must be a valid state"
    assert (initialState in states);
    "Accepting states must be valid states"
    assert (acceptingStates.subset(states));
    
    Boolean identifierPart(Character character) => character.letter || character.digit || character == '_';
    "State names must be composed of valid identifier parts"
    assert (states.every((String state) => state.every(identifierPart)));
    "Alphabet must be valid identifier parts"
    assert (symbols.every(identifierPart));
    
    value blank = '_';
    "`_` symbol is reserved for blank symbol"
    assert (!blank in symbols);
    value allSymbols = symbols | SingletonSet(blank);
    
    /*
     toplevel declarations can’t end with underscore,
     so we terminate all names explicitly.
     */
    String symbolTypeName(Character symbol)
            => "Symbol_``symbol``_T";
    String inputTypeName(Character symbol)
            => "Input_``symbol``_T";
    String inputInstanceName(Character symbol)
            => "input_``symbol``_T";
    String stateTypeName(String state)
            => "State_``state``_T";
    
    "The definitions for the data tape:
     One enumerated `Symbol` interface,
     with one case type `Symbol_${symbol}` per [[symbol|symbols]],
     along with the definitions of those tape symbol interfaces."
    shared {InterfaceDefinition*} symbolDefinitions
            => {
        interfaceDefinition {
            name = "Symbol";
            caseTypes = { for (symbol in allSymbols) symbolTypeName(symbol) };
            annotations = annotations { "shared" };
        },
        for (symbol in allSymbols)
            interfaceDefinition {
                name = symbolTypeName(symbol);
                satisfiedTypes = { "Symbol" };
                annotations = annotations { "shared" };
            }
    };
    
    "The definitions for the input:
     One enumerated class `Input_${symbol}`
     satisfying `Symbol_${symbol}` (see [[symbolDefinitions]])
     and one object `input_${symbol}`
     per [[input symbol|inputSymbols]]."
    shared {ClassDefinition|ObjectDefinition*} inputDefinitions
            => expand {
        for (symbol in inputSymbols)
            {
                classDefinition {
                    name = inputTypeName(symbol);
                    satisfiedTypes = { symbolTypeName(symbol) };
                    annotations = annotations {
                        doc = symbolDescription(symbol);
                        "shared", "abstract"
                    };
                },
                ObjectDefinition {
                    name = LIdentifier(inputInstanceName(symbol));
                    extendedType = extendedType(inputTypeName(symbol));
                    annotations = annotations { "shared" };
                    body = ClassBody([]);
                }
            }
    };
    
    "The definitions for the states:
     One enumerated `State` interface
     with one case type `State_${state}` per [[state|states]],
     along with the definitions of those state interfaces."
    shared {InterfaceDefinition*} stateDefinitions
            => {
        interfaceDefinition {
            name = "State";
            caseTypes = { for (state in states) stateTypeName(state) };
            annotations = annotations { "shared" };
        },
        for (state in states)
            interfaceDefinition {
                name = stateTypeName(state);
                satisfiedTypes = { "State" };
                annotations = annotations {
                    doc = stateDescription(state);
                    "shared"
                };
            }
    };
    
    """The definition of the `Box` interface:
       
           "Box around three types."
           shared interface Box<out First, out Second, out Third> {
               shared formal First first;
               shared formal Second second;
               shared formal Third third;
           }"""
    shared InterfaceDefinition boxDefinition
            => interfaceDefinition {
        name = "Box";
        typeParameters = {
            for (typeParameter in { "First", "Second", "Third" })
                TypeParameter(UIdentifier(typeParameter), OutModifier())
        };
        annotations = annotations {
            "Box around three types.";
            "shared"
        };
        
        for (typeParameter in { "First", "Second", "Third" })
            ValueDeclaration {
                name = LIdentifier(String { typeParameter.first?.lowercased else 'X', *typeParameter.rest });
                type = baseType(typeParameter);
                annotations = annotations { "shared", "formal" };
            }
    };
    
    """The definition of the stack interfaces:
       
           shared interface ${side}SideStack
                   of ${side}StackHead<Symbol, Stack> | ${side}StackEnd 
               shared formal Symbol first;
               shared formal ${side}SideStack rest;
           }
           shared interface ${side}StackHead<out Element, out Rest>
                   satisfies ${side}SideStack
                   given Element satisfies Symbol
                   given Rest satisfies ${side}SideStack {
               shared actual formal Element first;
               shared actual formal Rest rest;
           }
           shared interface ${side}StackEnd
                   satisfies ${side}SideStack {
               shared actual formal Nothing first;
               shared actual formal Nothing rest;
           }
       
       for `side` in “Left”, “Right”.
       
       (We need two non-disjoint stack interfaces in order to be able to peek
       left and right simultaneously and independently.)"""
    shared {InterfaceDefinition*} stackDefinitions
            => expand {
        for (side in { "Left", "Right" })
            {
                interfaceDefinition {
                    name = "``side``SideStack";
                    caseTypes = { baseType("``side``StackHead", "Symbol", "``side``SideStack"), "``side``StackEnd" };
                    annotations = annotations { "shared" };
                    
                    for (type->name in { "Symbol"->"first", "``side``SideStack"->"rest" })
                        ValueDeclaration {
                            name = LIdentifier(name);
                            type = baseType(type);
                            annotations = annotations { "shared", "formal" };
                        }
                },
                interfaceDefinition {
                    name = "``side``StackHead";
                    typeParameters = { TypeParameter(UIdentifier("Element"), OutModifier()), TypeParameter(UIdentifier("Rest"), OutModifier()) };
                    satisfiedTypes = { "``side``SideStack" };
                    typeConstraints = {
                        TypeConstraint {
                            parameterName = UIdentifier("Element");
                            satisfiedTypes = satisfiedTypes("Symbol");
                        },
                        TypeConstraint {
                            parameterName = UIdentifier("Rest");
                            satisfiedTypes = satisfiedTypes("``side``SideStack");
                        }
                    };
                    annotations = annotations { "shared" };
                    
                    for (type->name in { "Element"->"first", "Rest"->"rest" })
                        ValueDeclaration {
                            name = LIdentifier(name);
                            type = baseType(type);
                            annotations = annotations { "shared", "actual", "formal" };
                        }
                },
                interfaceDefinition {
                    name = "``side``StackEnd"; // home of Stilbo Stackins
                    satisfiedTypes = { "``side``SideStack" };
                    annotations = annotations { "shared" };
                    
                    for (type->name in { "Nothing"->"first", "Nothing"->"rest" })
                        ValueDeclaration {
                            name = LIdentifier(name);
                            type = baseType(type);
                            annotations = annotations { "shared", "actual", "formal" };
                        }
                }
            }
    };
    
    "The definition of the `Accept` alias,
     a `Box` (see [[boxDefinition]]) around all [[accepting states|acceptingStates]]
     (and any stack)."
    shared TypeAliasDefinition acceptDefinition
            => TypeAliasDefinition {
        name = UIdentifier("Accept");
        specifier = TypeSpecifier(baseType("Box",
                acceptingStates_seq.longerThan(1)
                        then UnionType([for (state in acceptingStates_seq) baseType(stateTypeName(state))])
                        else baseType(stateTypeName(acceptingStates_seq.first)),
                "LeftSideStack", "RightSideStack"));
        annotations = annotations {
            "Accepting state`` acceptingStates.longerThan(1) then "s" else "" ``";
            "shared"
        };
    };
    
    """The definition of the `b` function
       that can be used to build a stack:
       
           shared RightStackHead<First, Rest> b<First, Rest>(First first, Rest rest)
                   given First satisfies Symbol
                   given Rest of RightStackHead<Symbol, Stack> | RightStackEnd
                            satisfies RightStack {
               return nothing;
           }    """
    shared FunctionDefinition buildFunctionDefinition
            => functionDefinition {
        name = "b";
        type = baseType("RightStackHead", "First", "Rest");
        typeParameters = { "First", "Rest" };
        parameters = { for (type->name in { "First"->"first", "Rest"->"rest" }) ValueParameter(baseType(type), LIdentifier(name)) };
        typeConstraints = {
            TypeConstraint {
                parameterName = UIdentifier("First");
                satisfiedTypes = satisfiedTypes("Symbol");
            },
            TypeConstraint {
                parameterName = UIdentifier("Rest");
                caseTypes = caseTypes(baseType("RightStackHead", "Symbol", "RightSideStack"), baseType("RightStackEnd"));
                satisfiedTypes = satisfiedTypes("RightSideStack");
            }
        };
        annotations = annotations { "shared" };
        
        Return(baseExpression("nothing"))
    };
    
    """The definition of the `e` function
       that can be used to obtain an empty stack:
       
           shared RightStackEnd e() {
               return nothing;
           }"""
    shared FunctionDefinition endFunctionDefinition
            => functionDefinition {
        name = "e";
        type = baseType("RightStackEnd");
        annotations = annotations { "shared" };
        
        Return(baseExpression("nothing"))
    };
    
    """The definition of the `initial` function
       that can be used to turn an initial stack
       into an initial state + tape:
       
           shared Box<State_${initialState}, LeftStackEnd, Input> initial<Input>(Input input)
                   given Input satisfies RightSideStack {
               return nothing;
           }"""
    shared FunctionDefinition initialFunctionDefinition
            => functionDefinition {
        name = "initial";
        type = baseType("Box", stateTypeName(initialState), "LeftStackEnd", "Input");
        typeParameters = { "Input" };
        parameters = { ValueParameter(baseType("Input"), LIdentifier("input")) };
        typeConstraints = {
            TypeConstraint {
                parameterName = UIdentifier("Input");
                satisfiedTypes = satisfiedTypes("RightSideStack");
            }
        };
        annotations = annotations { "shared" };
        
        Return(baseExpression("nothing"))
    };
    
    throws (`class IllegalStateException`,
        "If the [[transition]] function attempts to transition to an illegal state.")
    throws (`class IllegalSymbolException`,
        "If the [[transition]] function attempts to write an illegal symbol.")
    shared FunctionDefinition transitionFunctionDefinition(
        "The transition function.
         
         Returns:
         1. next state,
         2. symbol to write (`_` for blank),
         3. movement"
        throws (`class IllegalStateException`,
            "If the [[state]] is illegal.
             
             This should never happen, but the function may wish to `switch` on the possible states,
             and then throw this exception in the `else` case that is necessary to guarantee exhaustiveness.")
        throws (`class IllegalSymbolException`,
            "If the [[symbol]] is illegal.
             
             This should never happen, but the function may wish to `switch` on the possible symbols,
             and then throw this exception in the `else` case that is necessary to guarantee exhaustiveness.")
        [String, Character, Movement] transition(
            "Current state"
            String state,
            "Read symbol (`_` for blank)"
            Character symbol)) {
        
        {IntersectionType+} createBranch(String state, Character? symbol) {
            value result = transition(state, symbol else blank);
            value nextState = result[0];
            value nextSymbol = result[1];
            value movement = result[2];
            
            if (!nextState in states) {
                throw IllegalStateException(nextState);
            }
            if (!nextSymbol in allSymbols) {
                throw IllegalSymbolException(nextSymbol);
            }
            
            BaseType rightTested;
            BaseType rightTarget;
            if (exists symbol) {
                rightTested = baseType("Right");
                rightTarget = baseType(symbolTypeName(symbol));
            } else {
                rightTested = baseType("RightStack");
                rightTarget = baseType("RightStackEnd");
            }
            
            switch (movement)
            case (left) {
                /*
                 We need to test for two possibilities:
                 1. There is a character to our left (LeftStack == LeftStackHead), move by shifting it to the right
                 2. There is no character to our left (LeftStack == LeftStackEnd), move by inserting a blank to the right
                 */
                return {
                    IntersectionType([
                            baseType("CurrentState"),
                            baseType(stateTypeName(state)),
                            rightTested,
                            rightTarget,
                            baseType("LeftStack"),
                            baseType("LeftStackHead", "Symbol", "LeftSideStack"),
                            baseType("Box", stateTypeName(nextState), "LeftRest", baseType("RightStackHead", "Left", "RightStack"))
                        ]),
                    IntersectionType([
                            baseType("CurrentState"),
                            baseType(stateTypeName(state)),
                            rightTested,
                            rightTarget,
                            baseType("LeftStack"),
                            baseType("LeftStackEnd"),
                            baseType("Box", stateTypeName(nextState), "LeftStackEnd", baseType("RightStackHead", symbolTypeName(blank), "RightStack"))
                        ])
                };
            }
            case (none) {
                if (nextSymbol == (symbol else blank)) {
                    // shortcut: reuse LeftStack, RightStack
                    return {
                        IntersectionType([
                                baseType("CurrentState"),
                                baseType(stateTypeName(state)),
                                rightTested,
                                rightTarget,
                                baseType("Box", stateTypeName(nextState), "LeftStack", "RightStack")
                            ])
                    };
                } else {
                    return {
                        IntersectionType([
                                baseType("CurrentState"),
                                baseType(stateTypeName(state)),
                                rightTested,
                                rightTarget,
                                baseType("Box", stateTypeName(nextState), "LeftStack", baseType("RightStackHead", symbolTypeName(nextSymbol), "RightRest"))
                            ])
                    };
                }
            }
            case (right) {
                return {
                    IntersectionType([
                            baseType("CurrentState"),
                            baseType(stateTypeName(state)),
                            rightTested,
                            rightTarget,
                            baseType("Box", stateTypeName(nextState), baseType("LeftStackHead", symbolTypeName(nextSymbol), "LeftStack"), "RightRest")
                        ])
                };
            }
        }
        
        assert (nonempty branches = concatenate(
                for (state in states)
                    for (symbol in { null, *allSymbols })
                        createBranch(state, symbol)
            ));
        
        return functionDefinition {
            name = "t";
            type = UnionType(branches);
            typeParameters = {
                TypeParameter(UIdentifier("CurrentState"), OutModifier()),
                TypeParameter(UIdentifier("LeftStack"), OutModifier()),
                TypeParameter(UIdentifier("LeftRest"), OutModifier()),
                TypeParameter(UIdentifier("RightStack"), OutModifier()),
                TypeParameter(UIdentifier("RightRest"), OutModifier()),
                "Left",
                "Right"
            };
            parameters = {
                ValueParameter(baseType("Box", "CurrentState", "LeftStack", "RightStack"), LIdentifier("state")),
                ValueParameter(baseType("Left"), LIdentifier("left")),
                ValueParameter(baseType("LeftRest"), LIdentifier("leftRest")),
                ValueParameter(baseType("Right"), LIdentifier("right")),
                ValueParameter(baseType("RightRest"), LIdentifier("rightRest"))
            };
            typeConstraints = {
                TypeConstraint {
                    parameterName = UIdentifier("CurrentState");
                    satisfiedTypes = satisfiedTypes("State");
                },
                TypeConstraint {
                    parameterName = UIdentifier("Left");
                    satisfiedTypes = satisfiedTypes("Symbol");
                },
                TypeConstraint {
                    parameterName = UIdentifier("Right");
                    satisfiedTypes = satisfiedTypes("Symbol");
                },
                TypeConstraint {
                    parameterName = UIdentifier("LeftRest");
                    satisfiedTypes = satisfiedTypes("LeftSideStack");
                },
                TypeConstraint {
                    parameterName = UIdentifier("RightRest");
                    satisfiedTypes = satisfiedTypes("RightSideStack");
                },
                TypeConstraint {
                    parameterName = UIdentifier("LeftStack");
                    caseTypes = caseTypes(baseType("LeftStackHead", "Left", "LeftRest"), "LeftStackEnd");
                    satisfiedTypes = satisfiedTypes("LeftSideStack");
                },
                TypeConstraint {
                    parameterName = UIdentifier("RightStack");
                    caseTypes = caseTypes(baseType("RightStackHead", "Right", "RightRest"), "RightStackEnd");
                    satisfiedTypes = satisfiedTypes("RightSideStack");
                }
            };
            annotations = annotations { "shared" };
            
            Return(baseExpression("nothing"))
        };
    }
}

"Creates the type system Turing machine."
shared CompilationUnit createTuringMachine(
    states,
    symbols,
    inputSymbols,
    initialState,
    acceptingStates,
    "The transition function.
     
     Returns:
     1. next state,
     2. symbol to write,
     3. movement"
    throws (`class IllegalStateException`,
        "If the [[state]] is illegal.
         
         This should never happen, but the function may wish to `switch` on the possible states,
         and then throw this exception in the `else` case that is necessary to guarantee exhaustiveness.")
    throws (`class IllegalSymbolException`,
        "If the [[symbol]] is illegal.
         
         This should never happen, but the function may wish to `switch` on the possible symbols,
         and then throw this exception in the `else` case that is necessary to guarantee exhaustiveness.")
    [String, Character, Movement] transition(
        "Current state"
        String state,
        "Read symbol"
        Character symbol),
    "Optionally: Descriptions for the states."
    String? stateDescription(String state) => null,
    "Optionally: Descriptions for the symbols."
    String? symbolDescription(Character symbol) => null) {
    
    "The set of states in which the turing machine can be."
    Set<String> states;
    "The set of symbols that can be written onto the tape (excluding the blank symbol)."
    Set<Character> symbols;
    "The set of symbols that can be on the tape initially. Must be a subset of [[symbols]]."
    Set<Character> inputSymbols;
    "The initial state. Must be an element of [[states]]."
    String initialState;
    "The accepting states. Must be a subset of [[states]]."
    Set<String> acceptingStates;
    
    value creator = TuringMachineCreator(states, symbols, inputSymbols, initialState, acceptingStates);
    return CompilationUnit(concatenate(
            creator.symbolDefinitions,
            creator.inputDefinitions,
            creator.stateDefinitions,
            [creator.boxDefinition],
            creator.stackDefinitions,
            [creator.acceptDefinition],
            [creator.buildFunctionDefinition],
            [creator.endFunctionDefinition],
            [creator.initialFunctionDefinition],
            [creator.transitionFunctionDefinition(transition)]
        ));
}

shared class IllegalStateException(String state) extends Exception("Illegal state: ‘``state``’") {}
shared class IllegalSymbolException(Character symbol) extends Exception("Illegal symbol: ‘``symbol``’") {}
