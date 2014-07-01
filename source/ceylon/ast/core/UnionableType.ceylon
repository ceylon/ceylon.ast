"Types that can be children of a [[UnionType]].
 
 This class is only there to represent how types are parsed,
 not their semantics."
shared abstract class UnionableType()
        of IntersectionType | PrimaryType
        extends MainType() {
}
