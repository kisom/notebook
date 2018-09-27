#lang pollen

◊h1{Gödel, Escher, Bach}

◊blockquote{◊p{◊em{A metaphorical fugue on minds and machines in the
spirit of Lewis Carroll.}}}

◊section{◊p{◊newthought{Gödel, Escher, Bach is one of those books}
that many of us try to read through and far fewer finish. In an effort
to actually get through the book, I've been taking notes on my way
through; at the end of each chapter, I'd like to write up a chapter
summary, to put my notes in a more narrative form.}}

◊section{

◊h2{Introduction: A musico-logical offering}

◊p{◊newthought{This book deals with strange loops},
in which moving through the various layers of some hierarchical system
unexpectedly brings us right back to the beginning. Strange loops
embody the ideas of recursion and infinity, and as we look through the
lens of paradox we find highlighted a conflict between the finite and
the infinite. One such paradox that forms a cornerstone of strange
loops is Gödel’s incompleteness theorem, paraphrased as ◊em{all consistent
axiomatic formulations of number theory include undecidable
propositions} - that is, while proofs are demonstrations of
propositions, they occur in a fixed system.}

◊p{
Reasoning is a powerful tool, partly because it is a patterned process
that is governed to some extent by clearly communicable laws. Strange
loops can defy reason, though, particularly through self-reference. We
could try to ban self-reference, but the ability to reference oneself
directly (e.g. ◊em{this sentence is false}) as well indirectly
(◊em{the following sentence is false. The previous sentence is true.})
makes this a difficult, if not impossible, task. Bertrand and Russell
set out to do just this in the ◊em{Principia Mathematica}, deriving
all of known mathematics from logic, eventually defining a theory of
types via an artificial hierarchy. This theory of types was only
sufficient to handle Russell’s paradox, but not the Epimenides or
Grelling paradoxes. The idea of an ◊em{object language} at the bottom
of a hierarchy where references could only be to the specific domain
of the object arose, with metalanguages that described object
languages (or lower metalanguages). What Gödel’s paper noted was
that axiomatic system could derive all of the number-theoretic truths
and remain fully consistent.}

◊p{
If no axiomatic system can remain fully consistent, how can we program
intelligent behaviour? We have to build a hierarchy of rules; at the
bottom are simple rules with increasing layers of metarules. A core
thesis of the book is that strange loops involving self-modifying
rules (whether that self-modification is direct or indirect) are at
the core of intelligence.}

}

◊section{

◊h2{Chapter I: The MU-puzzle}

◊p{◊newthought{We will explore these ideas}
using ◊em{post-production systems}, which are those in which we are
given some initial form, some rules for manipulating these forms, and
perhaps a desired end state. For example, the MU-puzzle gives us an
initial form (◊strong{MI}), and a set of ◊em{rules of inference} (or
rules of production) that can be applied to a given state:}

◊ol{
◊li{Given a string with the last letter ◊strong{I}, a ◊strong{U} may be appended (ex. ◊strong{MI} -> ◊strong{MIU}).}
◊li{Given a string ◊strong{M}◊em{x}, we can obtain ◊strong{M}◊em{xx} (ex. ◊strong{MIU} -> ◊strong{MIUIU}).}
◊li{Any sequence of ◊strong{III} may be replaced with ◊strong{U}.}
◊li{Any occurrence of ◊strong{UU} may be dropped.}}

◊p{
In a formal system, we can think of a theorem as a string of symbols;
a proof becomes the sequence of steps (or derivation) in which
repeated application of the inference rules for the system
◊em{produce} the proof. The initial theorems (the free theorems) are
called ◊em{axioms}, and a requirement of formal systems is the set of
axioms must be characterised by a ◊em{decision procedure}, which is
some test for theoremhood that always terminates in a finite amount of
time.}

◊p{As we start to dig into formal systems, we’ll need to be able to
distinguish work that is done within the system from statements or
observations about the system. Intelligence has the inherent property
of being able to pop out of the current task to see what’s going on
and identify patterns. The ability to recognise patterns might be
another core property of intelligence; the unobservance of machines is
generally thought to be a defining characteristic of machines to many
people. As such, we’ll have three modes for dealing with formal
systems:}

◊ul{
◊li{The mechanical mode (M-mode), in which inference rules are mechanically applied to produce theorems.}
◊li{The intelligent mode (I-mode), in which we look for patterns.}
◊li{The un-mode (U-mode), which is yet to be described.}
}}

◊section{

◊h2{Chapter II: Meaning and Form in Mathematics}

◊p{◊newthought{What we’re looking for}

is more than just a description of the axioms: not all grammatically
correct forms are valid axioms, necessitating a test for
axiomhood. Sometimes, a formal system will include ◊em{axiom schemas},
a literal expression that provides such a test. For example, in the
pq-system, there is an axiom scheme such that
◊em{x}◊strong{p}-◊strong{q}◊em{x}- is considered an axiom if ◊em{x} is
composed of only hyphens. This early in the book, our formal systems
only cover axioms described as strings; in the future, there will be a
more nuanced notion of “form.”}

◊p{A key distinction between the pq-system and MU-puzzle is that the
pq-system only has lengthening rules, and lacks shortening
rules. Systems with this property have a decision procedure for their
axioms.}

◊p{Now we have consider meaning and form: the string
--◊strong{p}---◊strong{q}----- might symbolise 2+3=5, but does it
actually ◊em{mean} that? There is an isomorphism between pq-theorems
and additions: these two complex structures can be mapped onto each
other such that each part of each structure maps to a corresponding
part in the other. Isomorphism are also a cornerstone of intelligence;
Hofstadter particularly notes that “The perception of an isomorphism
between two known structures is a significant advance in knowledge…
such perceptions of isomorphism which create ◊em{meanings} in the
minds of people.” Similarly, a correspondence between symbols and
words is called an interpretation - but note that this correspondence
couldn’t be perceived without a prior choice of an interpretation of
the symbols. Interpretation does not imply any meaning; there are
meaningless interpretations devoid of isomorphic connections between
theorems in the system and reality.}}
