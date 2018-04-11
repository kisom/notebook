#lang pollen

◊h1{Ideas for a Lisp DCOS}
◊section{◊p{Uninspired by the current technologies for managing systems
(e.g. systemd and Salt), it would be interesting to build a Lisp
system for doing this. It may eventually be a way to hook into the the
◊(link "/ideas/hypervisor.html" "hypervisor") idea. The project is named
◊strong{SYSGOV}, for system governor.}

◊p{Currently, there are two components envisioned:
  ◊ul{

    ◊li{◊strong{SYSPLAN}: a system planner, taking the role of
    ensuring a machine's configuration and status is where it should
    be.}

    ◊li{◊strong{SYSMON}: a service manager and job scheduler, taking
    the role of ensuring a set of services are running on a machine
    and that scheduled tasks run.}}}

◊p{The goal for now is to target Linux systems, as that is what the
majority of server systems are running.}

◊p{There is some ◊(link "https://git.metacircular.net/kyle/sysgov"
"source code") available.}}

◊section{
◊h2{SYSPLAN}
◊p{Some of the questions the initial research aims to answer:
  ◊ul{
    ◊li{What does a system specification look like?}
    ◊li{How does an overseer or supervisory node communicate changes
    to its charges?}
    ◊li{How is this done securely?}}}

◊p{One idea for this is to integrate some AI planning research into
the system to allow it to intelligently plan for resource usage.}

◊p{This leads to the service discovery problem: if services are run
dynamically, how are they found? How are changes to the service state
(e.g. what if the service is moved) handled?}}

◊section{
◊h2{SYSMON}

◊p{Starting to dig into SYSPLAN led to SYSMON. It's intended as a
replacement for certain parts of systemd and the docker management
systems.}

◊p{This needs a lot of digging into some deep Unix systems programming.
  ◊ul{
    ◊li{What is the ◊strong{correct} action when a service exits?}
    ◊li{How should logging, status, and job results be collected and published?}}}}

◊section{
◊h2{Other ideas}
◊p{
  ◊ul{
    ◊li{Using Nebula/Irmin as a file store.}
    ◊li{How to securely share secrets?}
    ◊li{Logging?}
    ◊li{Service discovery?}}}}
