#lang pollen

◊h1{Sets}

◊p{◊strong{Motivation}: Sets are the modeling language of mathematics and
a fundamental skill.}

◊p{◊strong{Definition 1}: A set is a collection of unique objects.}

◊p{◊strong{Definition 2}: ◊${A \subset B} iff ◊${\{a : a \in A \text{ and } a \in B\}}}

◊p{◊strong{Definition 3}: ◊${A \cup B = \{x : x \in A \text{ and } x \in B\}}}

◊p{◊strong{Definition 4}: ◊${A \cap B = \{x : x \in A \text{ or } x \in B\}}}

◊p{◊strong{Theorem 1}: ◊${\varnothing} is a subset of all other sets.}
◊p{◊strong{Proof:} There are no elements in ◊${\varnothing}, therefore all elements in
◊${\varnothing} are elements of any other set.}
◊p{◊${\square}}

◊p{◊strong{Theorem 2}: ◊${A \cap B \subset A}}
◊p{◊strong{Proof}:

Assume ◊${A} is a set with cardinality 1, e.g. ◊${A = \{a\}}.
Assume ◊${B} is a set with cardinality 0, e.g. ◊${B = \varnothing}.

By definition 4, ◊${A \cap B = \{a\}}.

By definition 2, ◊${A \cap B \subset A}.}
◊p{◊${\square}}

◊p{◊strong{Theorem 3}: ◊${A \subset A \cup B}}
◊p{◊strong{Proof}:

Assume ◊${A} is a set with cardinality 1, e.g. ◊${A = \{a\}}.
Assume ◊${B} is a set with cardinality 0, e.g. ◊${B = \varnothing}.

By definition 3, ◊${A \cup B = \varnothing}

By definition 1, since there are no elements in ◊${\varnothing}, every
element in ◊${A \cup B} appears in ◊${A}. Therefore, ◊${A \subset A \cup B}.}

◊p{◊${\square}}
