"A [[Transformer]] with the default operation to narrow the type of the visited subject;
 all methods for abstract node types have a default implementation while those for
 concrete node types remain formal.
 
 There are two ways to perform this narrowing:
 - [[immediately|ImmediateNarrowingTransformer]], by invoking the [[`transform`|Node.transform]] method on the subject, or
 - [[cascadingly|CascadingNarrowingTransformer]], where each method switches on the enumerated subtypes of the node type
   and narrows only by one layer by invoking the corresponding `transformX` method
   on the transformer.
 
 It should be possible to use them interchangeably (swap out the satisfying type of your
 implementing class without any effect), and since the immediate version is faster (it’s only
 a virtual method lookup instead of a series of calls and type checks), you should probably
 use that."
shared interface NarrowingTransformer<out Result>
        of ImmediateNarrowingTransformer<Result> | CascadingNarrowingTransformer<Result>
        satisfies Transformer<Result> {
    shared formal Result transformAddingExpression(AddingExpression that);
    shared formal Result transformAssigningExpression(AssigningExpression that);
    shared formal Result transformComparingExpression(ComparingExpression that);
    shared formal Result transformConjoiningExpression(ConjoiningExpression that);
    shared formal Result transformDisjoiningExpression(DisjoiningExpression that);
    shared formal Result transformEquatingExpression(EquatingExpression that);
    shared formal Result transformExistsNonemptyExpression(ExistsNonemptyExpression that);
    shared formal Result transformExponentiatingExpression(ExponentiatingExpression that);
    shared formal Result transformIntersectingExpression(IntersectingExpression that);
    shared formal Result transformInvertingExpression(InvertingExpression that);
    shared formal Result transformMultiplyingExpression(MultiplyingExpression that);
    shared formal Result transformNegatingExpression(NegatingExpression that);
    shared formal Result transformPrePostfixingExpression(PrePostfixingExpression that);
    shared formal Result transformScalingExpression(ScalingExpression that);
    shared formal Result transformSpanningExpression(SpanningExpression that);
    shared formal Result transformStructureExpression(StructureExpression that);
    shared formal Result transformThenElseExpression(ThenElseExpression that);
    shared formal Result transformUnioningExpression(UnioningExpression that);
}
