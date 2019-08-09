#lang pollen

◊h1{Sets}

◊section{
◊p{◊strong{Motivation}: Sets are the modeling language of mathematics and
a fundamental skill.}
}

◊section{
◊h2{Definitions}
◊p{◊strong{Definition 1}: A set is a collection of unique objects.}

◊p{◊strong{Definition 2}: A is defined as the subset of B (denoted by
◊${A \subset B}) iff ◊${\{a : a \in A \text{ and } a \in B\}}.}

◊p{◊strong{Definition 3}: The union of two sets ◊${A \cup B} is
defined as ◊${A \cup B = \{x : x \in A \lor x \in B\}}.
◊margin-note{Note that in maths, ◊${=} implies equivalence, not
assignment.}

◊p{◊strong{Definition 4}: The intersection of two sets ◊${A \cap B} is
defined as ◊${A \cap B = \{x : x \in A \land x \in B\}}.}}

◊p{◊strong{Definition 5}: The product of two sets ◊${A, B}, denoted
◊${A \times B} is the set of all ordered pairs ◊${{a, b} : a \in A, b \in B}.}

◊p{◊strong{Definition 6}: Let ◊${A, B} be sets, and ◊${F \subset A
\times B}.  We say ◊${F} is a function if and only if it satisfies the
following property: for each ◊${a \in A}, there is a unique pair ◊${(a, b) \in F}
(an input must have exactly one output). The set ◊${A} is called the
◊em{domain} of F and ◊${B} is called the ◊em{codomain} of ◊${F}. We
denote this with the arrow notation: ◊${f: A \to B}.}

◊p{◊strong{Definition 7}: Given a function ◊${f: A \to B}, we define the image
of ◊${f} as the set ◊${f(A) = \{f(a) : a \in A\}}. Alternatively,
◊$${\text{im } f = \{b \in B: \exists a \in A \text{ with } f(a) = b\}}}

◊p{◊strong{Definition 8}: Let ◊${A, B} be sets and ◊${f: A \to B} a
function. The ◊em{preimage} of ◊${B} under ◊${f} is defined as
◊$${f^{-1}(b) = \{a \in A: f(a) = b\}}}

◊p{◊strong{Definition 9}: A function ◊${f: A \to B} is called an
◊em{injection} (it is injective) if ◊$${\exists a, a' \in A, a \neq a':
f(a) \neq f(a')}}

◊p{◊strong{Definition 10}: A function ◊${f: A \to B} is called a
◊em{surjection} (it is surjective) if ◊${\forall b \in B, \exists a
\in A} such that ◊${f(a) = b}. A function is a ◊em{bijection} if it is
both surjective and injective.}

◊p{◊strong{Definition 11}: Inverses are unique.}}

◊section{
◊h2{Theorems}
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
