#lang pollen

◊h1{Sets}

◊section{
◊p{◊strong{Motivation}: Sets are the modeling language of mathematics and
a fundamental skill.}

◊p{◊strong{Definition 1}: A set is a collection of unique objects.}

◊p{◊strong{Definition 2}: ◊${A \subset B} iff ◊${\{a : a \in A \text{ and } a \in B\}}}

◊p{◊strong{Definition 3}: ◊${A \cup B = \{x : x \in A \text{ and } x \in B\}}
◊margin-note{Note that in maths, ◊${=} implies equivalence, not assignment.}}

◊p{◊strong{Definition 4}: ◊${A \cap B = \{x : x \in A \text{ or } x \in B\}}}
}

◊section{
◊p{◊strong{Theorem 1}: ◊${\varnothing} is a subset of all other sets.
◊margin-note{This theorem isn't in the book, but I wanted to prove it to myself
and to use it as a foundation for the other proofs.}}
◊p{◊strong{Proof:}
◊br{}◊br{}
There are no elements in ◊${\varnothing}, therefore all elements in
◊${\varnothing} are elements of any other set.}
◊p{◊${\square}}

◊p{◊strong{Theorem 2}: ◊${A \cap B \subset A}}
◊p{◊strong{Proof}:
◊br{}◊br{}
Assume ◊${A} is a set with cardinality 1, e.g. ◊${A = \{a\}}.◊br{}
Assume ◊${B} is a set with cardinality 0, e.g. ◊${B = \varnothing}.◊br{}
◊br{}
By definition 4, ◊${A \cap B = \{a\}}.◊br{}
◊br{}
By theorem 1 and definition 2, ◊${A \cap B \subset A}.}
◊p{◊${\square}}}

◊section{
◊p{◊strong{Theorem 3}: ◊${A \subset A \cup B}}
◊p{◊strong{Proof}:
◊br{}◊br{}
Assume ◊${A} is a set with cardinality 1, e.g. ◊${A = \{a\}}.◊br{}
Assume ◊${B} is a set with cardinality 0, e.g. ◊${B = \varnothing}.◊br{}
◊br{}
By definition 3, ◊${A \cup B = \varnothing}
◊br{}◊br{}
By theorem 1 and definition 4, since there are no elements in
◊${\varnothing}, every element in ◊${A \cup B} appears in
◊${A}. Therefore, ◊${A \subset A \cup B}.}

◊p{◊${\square}}}
