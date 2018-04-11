#lang pollen

◊h1{A content-addressable data store with object capabilities}

◊section{
◊h2{What is Nebula?}

◊p{◊strong{Nebula} is a content-addressable file store that uses a
capability model for security.}}

◊section{
◊h2{What problem are you trying to solve?}

◊p{Users have data: they want to be able to keep track of revisions to this data,
and they would like to be able to share this data with other users. Users
would also like the ability to cluster into groups to share and collaborate
on this data.}

◊p{Secondary objectives are to build real world experience designing,
implementing, and operating capability systems; and to characterise the
behaviour of capability systems in the real world.}}

◊section{
◊h2{What are the characteristics of a solution?}

◊p{
  ◊ol{

    ◊li{Users must be able to upload and retrieve data.}

    ◊li{Users must be able to view the history of their data.}

    ◊li{Users should be able to share data with other users.}

    ◊li{A user should be able to refer to a piece of data as a leaf in
    a history tree, as a node in the tree, or as an isolated snapshot
    with the history information stripped.}

    ◊li{Users should have some assurance as to the integrity and
    confidentiality of their data: one user should not be able to read
    another user's file unless permission has been explicitly granted
    ◊strong{or} unless the other user has their own copy of that
    data.}}}}


◊section{
◊h2{Towards a solution}
◊h3{Data blobs}

◊p{Data is referred to by the SHA-256 hash of the contents of the
file. For technical reasons, this could be prefixed to reside in some
directory tree structure. There are two options for this: use a prefix
(such as the first ◊em{n} bytes of the ID, or where each byte is a
directory. Example:}

◊p{Example: given the SHA-256 ID}

◊pre{
000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f
}

◊p{The first solution (with a prefix of 4) yields the path}

◊pre{
0001/02030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f
}

◊p{The second yields}

◊pre{
00/01/02/03/04/05/06/07/08/09/0a/0b/0c/0d/0e/0f/10/11/12/13/14/15/16/17/18/19/1a/1b/1c/1d/1e/1f
}

◊p{From a file system performance perspective, the two options are
equally difficult to implement, and the latter will provide better
performance. As data will always be referenced by a SHA-256 hash (a
constraint that ◊strong{must} be enforced in the code), this should
not be a problem.}

◊h3{References to blobs}

◊p{Users directly interacting with blobs presents two problems:
  ◊ol{

    ◊li{Information leakage: if Alice wants to determine if someone
    already has a copy of some data, she attempts to read its SHA-256
    digest. The server will return the data if she has it. This data
    is of no consequence to Alice, as she likely already had a copy of
    the data to produce the hash.}

    ◊li{Managing data is more difficult: in the case where a user asks
    the server to delete a file that multiple users have, the server
    has no way to determine what other users might have the data. One
    user can then remove data that other users may still wish to
    retain. Alternatively, the server might refuse to delete this
    data, which means users have no way to remove data from the
    system.}}}

◊p{The solution is to only access blob IDs in the software, and to
provide users with UUIDs to reference their data. A UUID contains

  ◊ul{

    ◊li{the ID}
    ◊li{the referenced object ID (see below, this may be a SHA-256 ID or another UUID)}
    ◊li{metadata}
    ◊li{the parent UUID}
    ◊li{UUIDs of any children}}}

◊p{In order to provide useful access control, a reference may be a
◊strong{proxy} reference: that is, it may refer to another blob
reference. This means that a user can grant revocable access to the
data ◊em{without} jeopardizing their own access.}

◊p{Therefore, to know an ID is to have access to that ID. For this
reason, users can only see the metadata and none of the IDs. The
system needs an API that can traverse the history tree without
exposing these IDs to users. Proxy objects either need to be presented
with no history information (empty parent and children), or the entire
history needs to be proxied. Similarly, a revocation API needs to be
able to take into account that the entire history tree may be
proxied.}

◊p{This data must be stored in a persistent data structure, such as a
database.}

◊p{This reference is named an ◊em{entry}. This reference is the only
interface users have with blobs.}

◊h3{Named histories}

◊p{Constantly referring to a UUID for file revisions is something that
users will find awkward. A useful abstraction is a named history:
presenting a single reference to a history tree that always provides
the newest copy of some data, while still allowing users to traverse
the history. This abstraction needs to pair some notion of the owner
with a name of their choosing; this pairing is termed a
◊em{file}. Writing to a file creates a new entry with the parent set to
the file's current reference, and the file's reference is updated to
the new entry's ID.}

◊h3{Users}

◊p{Users will be identified by a UUID, as will collections of users
(termed ◊em{group}). This allows groups and users to be
interchangeable.}

◊p{◊strong{Challenge}: how to deal with removing a user from a group? To know
an ID is to have access to the ID, so new IDs will need to be
generated for each object owned by a group; this change will need to
be communicated to the group. Groups are not granular at this time:
access to a group ID means all users can read or write entries and
files. Group leadership will probably belong to a single user. This a
subject that should be considered for revision in future.}}

◊section{
◊h2{The API}
◊p{
  ◊ul{
    ◊li{create, update, delete entries}
    ◊ul{

	◊li{note that garbage collection will need to be done when a
	user entry is removed: if no other entry refers to a blob,
	that blob should be removed from the store.}

	◊li{update creates a new entry with the parent of the new
	entry and the children field of the parent updated
	appropriately.}}

    ◊li{create, update, delete, list files}
    ◊li{grant or revoke access}
    ◊ul{
	◊li{this needs to account for the need to proxy histories}}
    ◊li{group creation, inviting, transfer of ownership}}}}

◊section{
◊h2{A demo use case}

◊p{A demo of the Nebula system would be to build an HTTP front end that
uses ◊(link "https://codemirror.org/" "Codemirror") to implement a
collaborative editor.}}

◊section{

◊h2{Sync}

◊p{At some point it would be advantageous to sync data. Armstrong
◊(link "http://joearms.github.io/2015/03/12/The_web_of_names.html" "proposes")
the use of a DHT. However, implementing sync in this manner means that
any participating node has access to all the blobs where no guarantee
is made that peers are securing this data; this presents a large hole
for data leakage. Participating nodes ◊strong{must} have some sort of
authentication. The most straight-forward mechanism for this is to
communicate over an interface such as
◊(link "https://kyleisom.net/projects/schannel/" "schannel") with mutual
authentication. This brings the complexity of requiring a signature
authority trusted by all users. A synchronisation mechanism must
operate in a hostile environment:

  ◊ul{

    ◊li{At the core, user data ◊strong{must} be protected: just as
    users expect their data to remain secure on the single node
    system, so too should their data be secured across all nodes.

    ◊li{A participant should expect that some participants are
    actively trying to exploit data leakage.}

    ◊li{Participants must have strong mutual authentication, which
    implies strong identity. Nodes may be pseudonymous, but they
    cannot be fully anonymous. Peer reputation is a necessity.}

    ◊li{Communications ◊strong{must} occur over a secure channel (see
    ◊em{Cryptography Engineering} or ◊code{schannel}).}

    ◊li{Alternate (not schannel) alternatives should be explored. One
    alternative is hosts identified by a UUID and using remote
    attestation or another form of TPM-based
    authentication. Particularly interesting would be decentralised
    authentication and attestation, but it is difficult to see how
    trust could be bootstrapped this way.}}}}}

◊section{
◊h2{Towards a production version}

◊p{There seem to be two phases to the project now that a development
version exists:

  ◊ul{
    ◊li{The first step is to make this usable from a unikernel
    system.}

    ◊li{Once the unikernel system is built, work can proceed towards
    enabling this as a hypervisor service.}}}

◊p{The unikernel stage aims to make this a standalone system that can
operate with only some disk. The SQLite data store is out of the
question, which means that some system for figuring out how to
serialise and store the metadata is in order. An alternative interface
to the current HTTP/REST interface will also need to be devised.}}

◊section{
◊h2{Code / demos}

◊p{
  ◊ul{

    ◊li{The ◊(link "https://github.com/kisom/nebula-rkt" "first sketch") was
    in Racket.}

    ◊li{There is an in-progress Haskell version and an aborted Go
    implementation.}

    ◊li{The ◊(link "https://github.com/kisom/nebula/" "current development") version
	    has a RESTish API and is written in Clojure.}}}}}}

◊p{Last updated on 2015-03-30.}

  
