#lang pollen

◊h1{Sets}

◊section{
◊p{◊strong{Motivation}: Sets are the modeling language of mathematics and
a fundamental skill.}

◊p{◊strong{Definition 1}: A set is a collection of unique objects.}

◊p{◊strong{Definition 2}: A is defined as the subset of B (denoted by
◊${A \subset B}) iff ◊${\{a : a \in A \text{ and } a \in B\}}.}

◊p{◊strong{Definition 3}: The union of two sets ◊${A \cup B} is
defined as ◊${A \cup B = \{x : x \in A \lor x \in B\}}.
◊margin-note{Note that in maths, ◊${=} implies equivalence, not
assignment.}}

◊p{◊strong{Definition 4}: The intersection of two sets ◊${A \cap B} is
defined as ◊${A \cap B = \{x : x \in A \land x \in B\}}.}}

◊section{
◊p{
◊strong{Theorem 1}: ◊${\varnothing} is a subset of all other sets. That is,
◊${\forall A \text{ where } A \text { is a set,} \varnothing \subset A}.
◊margin-note{This theorem isn't in the book, but I wanted to prove it to myself
and to use it as a foundation for the other proofs.}}

◊p{◊strong{Proof:} There are no elements in ◊${\varnothing}, therefore
all elements in ◊${\varnothing} are elements of any other set.}
◊p{◊${\square}}

◊p{◊strong{Theorem 2}: ◊${A \cap B \subset A}}
◊p{◊strong{Proof}: Let ◊${C = A \cap B = \{x : x \in A \land x \in B\}}. By
definition 3, ◊${\forall c \in C, c \in A}. Therefore ◊${C \subset A}.}
◊p{◊${\square}}

◊p{◊strong{Theorem 3}: ◊${A \subset A \cup B}}
◊p{◊strong{Proof}: Let ◊${C = A \cup B = \{x : x \in A \lor x \in B\}}. By
definition, ◊${C} contains every element in ◊${A} and therefore ◊${A \subset C}.}
◊p{◊${\square}}
}
