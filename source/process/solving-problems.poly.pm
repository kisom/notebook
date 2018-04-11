#lang pollen

◊h1{Solving problems}

◊section{

◊p{◊newthought{Computers are tools} for solving problems, so it makes
sense to spend time thinking about how to actually use them for
this. The following is a list from a
Coursera◊margin-note{Specifically, the ◊(link "https://www.coursera.org/learn/algorithmic-toolbox/" "Algorithmic Toolbox")
course.} algorithms course:

◊ol{

◊li{◊strong{Read the problem statement}. What is the task? What are
the resource constraints?}

◊li{◊strong{Design the algorithms}. Prove its correctness and estimate
its performance.}

◊li{◊strong{Implement the algorithm}.}

◊li{◊strong{Test and debug}.}

◊li{◊strong{Deploy / publish / etc…}.}}}}

◊section{
◊h2{How to solve any problem}

◊p{◊newthought{How to solve it} is the name of a book by ◊(link
"https://press.princeton.edu/titles/669.html" "G. Pólya")
◊margin-note{Pólya, G. and Conway, J. (2014). ◊em{How to solve
it}. Princeton, NJ: Princeton University Press.} that describes an
approach for solving any problem. Thought it's mathematically focused,
it applies well to other domains. The steps for solving problems
outlined here are thus:

◊ol{
  ◊li{Understand the problem}
  ◊ol{
    ◊li{Clearly state the problem}
    ◊li{What is the goal of a solution to the problem?}
    ◊li{Break down the problem into sub-problems}}
  ◊li{Devise a plan}
  ◊ol{
    ◊li{Potential strategies:}
    ◊ul{
      ◊li{Eliminate possibilities}
      ◊li{Consider special and edge cases}
      ◊li{Apply direct reasoning}
      ◊li{Find patterns}
      ◊li{Draw diagrams}
      ◊li{Solve simpler problem}
      ◊li{Develop a model}
      ◊li{Be ingenious}}
    ◊li{Are there solutions to related problems? Have you seen similar
      problems before that you can apply to this (or to its
      sub-problems)?}}
  ◊li{Execute the plan}
  ◊ol{
    ◊li{Check each step.}
    ◊li{Seriously, double check your math. Simple errors
        always get me and they translate through.}}

  ◊li{Retrospective}
  ◊ol{
    ◊li{Does the solution fit the problem?}
    ◊li{What are the lessons learned from the process?}}}}}
