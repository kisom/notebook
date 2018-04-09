#lang pollen

◊h1{Turing machines}

◊p{One of the foundations of modern computing is the Turing Machine, but
embarassingly, I had only a vague understanding of the topic. I
recently subscribed to ◊(link "https://destroyallsoftware.com/"
"Destroy All Software"), and starting on the computation series.}

◊h2{Introduction}

◊p{One of the motivations behind the Turing Machine is exploring the
limits of computation via the halting problem:}

◊pre{
halt :: function → bool
}

◊p{The question is: does ◊code{function} always return? This is an
undecidable problem.}

◊p{The Chomsky hierarchy:
◊ol{
◊li{Regular expressions}
◊li{Simple programming languages}
◊li{Complex programming languages}
◊li{Turing equivalence}
}}

◊h2{Computing by changing}

Imperative model of computation: order of instructions matters, and generally
destructive operations.

Turing machine:

* infinite tape composed of cells, initialisation is the blank symbol ('B')
* head pointing to a cell on the tape
* instructions: head movement, read, write

Example machine: X_B

two-cell tape:

```
BB
^
```

rewrite first cell with X->B repeatedly: when we see a B, write an X. When we see an X, write a B.
head has to move on every single instruction, only one step
we'll move to the right
cell 2: read B, see B, move left

ex:

BB
^
XB
 ^
XB
^
BB
 ^

Turing machines aren't imperatively organised; it uses a state table.
state symbols:
s_1...s_4

(symbol, state) -> write, head move, next state
B, s1 -> X, R, s2
B, s2 -> B, L, s3
X, s3 -> B, R, s4 
B, s4 -> B, L, s1

a state table and four-line turing machine:

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

	simulate(X_B)


◊p{Last updated on 2018-04-08.}
