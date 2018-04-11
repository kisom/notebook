#lang pollen

◊h1{Turing machines}

◊blockquote{◊p{◊em{We are now in a position to show that the
Entscheidungsproblem cannot be solved.}}

◊footer{A.M. Turing, ◊em{◊(link "https://www.cs.cmu.edu/~15251/notes/turing.pdf" "On Computable Numbers, With an Application to
the Entscheidungsproblem")}.}}

◊section{◊p{◊newthought{One of the foundations} of modern computing is
the Turing Machine◊margin-note{See the Stanford Encyclopedia of
Philosphy's ◊(link
"https://plato.stanford.edu/entries/turing-machine/" "article on
Turing machines") for a more thorough introduction and background,
too.}, but embarassingly, I had only a vague understanding of the
topic. I recently subscribed to ◊(link
"https://destroyallsoftware.com/" "Destroy All Software"), and
starting on the computation series.}}

◊section{◊h2{Introduction}

◊p{◊newthought{One of the motivations} behind the Turing Machine is
exploring the limits of computation via the halting problem: can we
write a function ◊code{halt} that takes a function as an argument and
returns ◊em{true} if the function eventually halts? It turns out that
this is an unsolvable problem.}

◊section{

◊h2{Computing by changing}

◊p{◊newthought{Under the imperative model of computation},
the machine executes an ordered sequence of instructions. The order of
instructions matters, and operations are generally destructive - they
modify memory in place.}

◊p{
Fundamentally, a Turing machine is simple. It has four elements:
◊margin-note{Note that a Turing Machine is a type of state machine.}

◊ul{

◊li{An ◊em{infinite tape} that is composed of cells, each of which
contains either the blank symbol (by convention, ◊em{B} is used).}

◊li{A ◊em{tape head}, which points to the current cell in the
tape. The head must be moved during each state transition.}

◊li{The ◊em{state transition table}. Entries are defined by the tuple
(◊em{symbol, state}), and contain the tuple (◊em{write symbol, head
direction, next state}).}

◊li{The ◊em{current state}, as defined by the state table.}}

◊p{A minimal Turing machine can be written in four lines of
Python. Along with a corresponding state table, a complete program is
shown below. ◊margin-note{Note to self: replace this with a Racket
version.}  ◊margin-note{For simplicity, several things have been
hardcoded in this implementation, namely the tape size, the starting
state, and the number of iterations.}}

◊pre['((class "code"))]{
# toggle the first cell between 'X' and blank.
X_B = {
       ('B', 's1'): ('X', 'R', 's2'),
       ('B', 's2'): ('B', 'L', 's3'),
       ('X', 's3'): ('B', 'R', 's4'),
       ('B', 's4'): ('B', 'L', 's1')
}

def simulate(instructions):
    tape, head, state = ['B', 'B'], 0, 's1'
    for _ in range(8):
        (tape[head], head_dir, state) = instructions[(tape[head], state)]
        head += 1 if head_dir == 'R' else -1
}
}}

◊p{

}}

◊p{Last updated on 2018-04-11.}
