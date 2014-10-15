"Type System Turing Machine
 ==========================
 
 It is possible to emulate a Turing machine in the Ceylon type system.
 We can store the entire configuration of a Turing machine – its current state
 and its tape – in a single type, and define a function that performs a single
 step of the Turing machine, returning the type for the next state.
 
 The fundamental idea is that a function can declare multiple return types
 by returning a union of several type “branches”, and we assure that for every
 possible input (type arguments), exactly one branch will not be nothing.
 For example, given disjoint types `A1` and `A2`, the return type of
 
     I&A1 & X |
     I&A2 & Y
         fun<I>(I i)
             given I of A1 | A2
             => nothing;
 
 is assignable to
 - `X` if `I` is assignable to `A1`, and
 - `Y` if `I` is assignable to `A2`.
 
 The other branch will always be reduced to `Nothing` because it includes
 the intersection of the disjoint types `A1` and `A2`.
 
 However, if we want to define a function that “swaps” between `A1` and `A2`,
 we can’t do this:
 
     I&A1 & A2 |
     I&A2 & A1
         fun<I>(I i)
             given I of A1 | A2
             => nothing;
 
 The result of this function is always `Nothing`, because while logically
 only the last part (`A2` / `A1`) is the result we want, the typechecker only
 sees that we have an intersection of disjoint types here.
 To separate the result from the “selector”, we can use generics.
 Given a “box” type
 
     interface Box<out T> {
         shared formal T first;
     }
 
 we can write the function like this:
 
     I&A1 & B<A2> |
     I&A2 & B<A1>
         fun<I>(B<I> i)
             given I of A1 | A2
             => nothing;
 
 Note that the parameter also has the type `B<I>` rather than `I`,
 so that we can feed `fun`’s result into `fun` again directly.
 
 Of course, our box can also hold more than one type.
 To emulate a Turing machine, we need to hold three things:
 
 - The current state of the Turing machine,
 - a stack representing the tape to the left of the Turing machine’s head, and
 - a stack representing the tape to the right of the Turing machine’s head.
 
 The representation of the tape as two stacks also implicitly records
 the position of the head.
 
 The stack is represented through a linked list of types, similar to `Tuple`:
 
     shared interface RightSideStack
             of RightStackHead<Symbol, Stack> | RightStackEnd {
         shared formal Symbol first;
         shared formal RightSideStack rest;
     }
     shared interface RightStackHead<out Element, out Rest>
             satisfies RightSideStack
             given Element satisfies Symbol
             given Rest satisfies RightSideStack {
         shared actual formal Element first;
         shared actual formal Rest rest;
     }
     shared interface RightStackEnd
             satisfies RightSideStack {
         shared actual formal Nothing first;
         shared actual formal Nothing rest;
     }
 
 We also have `LeftSideStack`, `LeftStackHead` and `LeftStackEnd`,
 which are identical;
 we need to have two separate stack interfaces so that we can
 test them independently:
 If we had only one set of stack interfaces,
 and we tested that the right-side stack is a `StackHead`
 and the left-side stack is a `StackEnd`,
 we would end up with the type `Nothing`
 (because `StackHead` and `StackEnd` are disjoint).
 
 The tape `abc` can now be represented through the type
 
     RightStackHead<
         Symbol_A, RightStackHead<
             Symbol_B, RightStackHead<
                 Symbol_C, RightStackEnd>>>
 
 Now, we can begin defining the function that performs
 a Turing machine iteration.
 First, it needs a lot of type parameters:
 
     t
     <out CurrentState, out LeftStack, out LeftRest, out RightStack, out RightRest, out Left, out Right>
     (B<CurrentState, LeftStack, RightStack> state, Left left, LeftRest leftRest, Right right, RightRest rightRest)
             given CurrentState satisfies State
             given Left satisfies Symbol
             given Right satisfies Symbol
             given LeftRest satisfies LeftSideStack
             given RightRest satisfies RightSideStack
             given LeftStack of LeftStackEnd|LeftStackHead<Left, LeftRest>
                          satisfies LeftSideStack
             given RightStack of RightStackEnd|RightStackHead<Right, RightRest>
                          satisfies RightSideStack
 
 The return type is the union of all the “branches”.
 For each possible state of the Turing machine and each possible input symbol,
 as well as the option that the tape ends,
 we construct a branch as the intersection of:
 
 - `CurrentState`,
 - the tested state,
 - either:
     1. if we’re testing for an input symbol:
         - `Right`,
         - the tested symbol, OR
     2. if we’re testing for the end of the tape:
         - `RightStack`,
         - `RightStackEnd`
 - if we want to move left, there are two branches:
     1. check if we can move left:
         - `LeftStack`,
         - `LeftStackHead<Symbol, LeftSideStack>`, as well as
     2. check if we can’t move left:
         - `LeftStack`,
         - `LeftStackEnd`,
 - the box around:
     - the next state,
     - the left stack:
         1. if we’re moving left, depending on which branch from above we’re in:
             1. if we can move left: `LeftRest`
             2. if we can’t move left: `LeftStackEnd`
         2. if we’re not moving: `LeftStack`
         3. if we’re moving right: `LeftStackHead` around
             - the written symbol,
             - `LeftStack`
     - the right stack:
         1. if we’re moving left: `RightStackHead` around
             - depending on which branch from above we’re in:
                1. if we can move left: `Left`,
                2. if we can’t move left: the blank symbol
             - `RightStack`
         2. if we’re not moving: `RightStackHead` around
             - the written symbol,
             - `RightRest`
         3. if we’re moving right: `RightRest`
 
 For example, for the transition
 
 > When in state `SkipOverX` and reading `X`,
   write `X`, move right, and stay in state `SkipOverX`
 
 we produce the following branch:
 
     State&State_SkipOverX & Right&Symbol_X & Box<State_SkipOverX, LeftStackHead<Symbol_X, LeftStack>, RightRest>
 
 This is all done by the [[createTuringMachine]] function.
 
 The [[useTuringMachine]] function creates a “driver” function
 for this Turing machine.
 For every iteration of the Turing machine, this function contains one value,
 which is derived from the previous one like this:
 
     value s002 = t(s001, s001.second.first, s001.second.rest, s001.third.first, s001.third.rest);
 
 (`second` and `third` are members of `Box` that yield
 the left and right stack, respectively.)
 
 It also initializes the Turing machine by constructing an initial stack (tape)
 from the given input word.
 
 The last iteration is then assigned to a value of type `Accept`.
 `Accept` is an alias that was created by [[createTuringMachine]];
 it’s a box around the union of all accepting states of the Turing machine
 (and any left and right stack).
 If the Turing machine accepts the input word after the last iteration,
 then this assignment is well-typed;
 otherwise, it isn’t well-typed, and will have a typechecker error.
 
 The most important thing to note is that
 [[createTuringMachine]] doesn’t know the input word, and
 [[useTuringMachine]] doesn’t know the Turing machine,
 so the emulation of the Turing machine must really be happening
 in the type system."
shared package ceylon.ast.samples.turingMachine;
