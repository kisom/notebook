#lang pollen

◊h1{A hypervisor for the modern age}
◊section{
◊p{Having to deal with Linux (and Unix in general), and evaluating it in
context of what I want out of a secure operating system for network
spaces leaves much to be desired.}

◊p{To start thinking about the problem analytically, I need a problem
statement.}}

◊section{
◊h2{The problem statement}

◊blockquote{◊p{◊em{In order to develop secure network services and
systems in the future, it would be useful to have an operating system
that properly isolates applications, supports message-passing between
applications, and handles safe cooperating via access mediation
between applications.}}}

◊h3{Characterising the operating system}

◊p{This operating system has three characteristics:
  ◊ul{

    ◊li{◊em{Proper environment isolation}. This is somewhat subtly
    different than application isolation, but more useful as will be
    explored.}

    ◊li{◊em{Inter-environment isolation}. Given the previous point's
    focus on environments v. applications, it's more generally useful
    to pass messages between environments.}

    ◊li{◊em{Access mediation}. Allow environments to safely cooperate
    by controlling access.}}}

◊h3{Environments v. applications and isolation}

◊p{For the purposes of discourse, an application is a running
program. For example, ◊em{prosody} is an application that runs an HTTP
server. To borrow from a ◊(link
"https://lambda.kyleisom.net/ns/isolation.html" "previous article"),}

◊blockquote{◊p{The first feature is ◊em{isolated environments}◊numbered-note{The term environment here means the lexical environment;
it shouldn't be confused with the concept of Unix environments. A
lexical environment is the mapping of names to their values.};
environments should not be able to access each others'
environments. The scope of an environment should be considered;
typically, each thread and each process should have its own
environment. A process or thread can be spawned with a pre-initialised
environment that sets the initial values; this does not imply that the
child has access to the parent's environment, only that it has the
value for a name at program initialisation. This name may not even be
the actual value for the parent. For this document, the term
◊strong{isolation} will refer to environment isolation.}

◊p{A language runtime can provide only limited isolation. If the
program compiles to native code, its environment is still governed by
the operating system kernel. On a Unix system, the superuser can
attach a debugger to a process to inspect the various environments. On
a single-tenant◊numbered-note{A tenant is a user on the machine. This
can be defined at various scopes; in one view, it might be a system
that primarily runs one program. It might also be the case where a
tenant is a user. Cloud computing services, such as Amazon's EC2, are
examples of multi-tenant systems where multiple users who do not trust
each other run programs on the same machine. In the remainder of this
document, a tenant will be used in this definition. More precisely,
for this document, a tenant is a user on the machine who cannot
implicitly trust the other users on the machine.} system, this may be
acceptable. On a multi-tenant system, this may not be. Even on a
single-tenant system, however, a malfunctioning or poorly-written
program◊numbered-note{Security assists in protecting an application
not only from intentionally malicious users, but from possibly
unwittingly rogue applications also running. While they might not
intend to pose a threat, they may be able to corrupt memory or
otherwise degrade shared resources (such as the file system or network
interface).} may be able to affect the memory of other programs if the
operating system doesn't provide strict enough protections.}}

◊p{So for this document, an environment is considered a thread or
process of a running program.}

◊h3{Inter-environment messaging}

◊p{To quote the same article,

◊blockquote{◊p{An environment that
cannot share values to other environments isn’t very useful: some
mechanism for sharing values outside the environment is needed. This
is analogous to the problem of interprocess communication; the two
notable methods for IPC relevant to distributed network spaces are:}

◊p{
  ◊ul{
    ◊li{◊em{Sockets}: in which the processes communicate over a
    network connection of some sort.}

    ◊li{◊em{Message queues}: the kernel maintains an array of FIFO
    queues; processes agree on which message queue to use (i.e. by
    using the ◊code{ftok(3)} function).}}}

◊p{Most distributed systems end up using message queues: Erlang uses
them (thought it calls them "mailboxes"), for example. Each Erlang
process gets its own mailbox; senders pick a process to send the
message to, and processes must explicitly call ◊code{receive} to get
the next message. Distributed message queues, intended for use by
network applications, include the standard AMQP standard.}

◊p{The operating system that supported a slightly more intelligent
environment message queue (along the lines of Erlang named
environments or including some kind of environment discovery), with
support for local and remote message queues, if implemented on top of
an open message queue protocol, could be an interesting approach for
the network spaces IEC problem.}

◊p{Full environment isolation, including network interfaces and
filesystems, provides the best guarantee of security for a given
environment. A model in which environments cannot share any
information (including files) except via message passing, and in which
even network interfaces are not shared (e.g. by providing a virtual
network interface for each environment), and in which the operating
system is a minimal kernel (maybe a nanokernel) providing the minimum
level of hardware access, environment access control, and any other
security features (such as the attestation discussed below), would
provide a solid basis for a network space system.}}}

◊p{Whatever the solution turns out to be, it will need to provide
some mechanism for environments to communicate with each
other. This also raises the question of ◊em{service discovery}: how
do environments find each other, or determine which environment is
doing what?}

◊h3{Access mediation}

◊p{The hypervisor must ensure the first point is met. It must also
ensure that system resources are responsibly and safely
handled. Recall that the notion of security also applies to
misbehaving programs: an environment shouldn't be able to hog a
system resource.}

◊h3{Administration}

◊p{Another question is that of administration of the hypervisor. The
administrator must be able to load and provision new environments,
adjust capabilities as needed, and manage access to
resources. There should be an interactive component to this, but
it's also important to have a programmatic interface.}

◊p{The administrative interface leads to some interesting
questions. How does one debug an environment? The nature of debugging
means that isolation is broken◊numbered-note{One idea is to
communicate to an environment that it is currently being debugged. The
application can take the necessary steps to secure data or emit
additional debugging information).}.}}

◊p{Last updated on 2015-03-28.}
