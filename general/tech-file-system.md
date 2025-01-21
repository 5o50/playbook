# **File System - Storing the data**

[https://github.com/ipfs/specs/](https://github.com/ipfs/specs/)

[https://github.com/libp2p/specs/](https://github.com/libp2p/specs/)

[https://discuss.ipfs.io/t/why-does-the-pbnode-have-a-links-and-data-section/459/5](https://discuss.ipfs.io/t/why-does-the-pbnode-have-a-links-and-data-section/459/5)

[https://discuss.ipfs.io/t/how-does-files-api-ipfs-files-command-work/344/2](https://discuss.ipfs.io/t/how-does-files-api-ipfs-files-command-work/344/2)

[https://discuss.ipfs.io/t/what-makes-ipfs-different-from-other-p2p-file-systems/3893/3](https://discuss.ipfs.io/t/what-makes-ipfs-different-from-other-p2p-file-systems/3893/3)

- **Archive**

    [https://archives.ipfs.io/](https://archives.ipfs.io/)

    [https://ipfs.io/ipns/docs.ipfs.io/guides/examples/snapshots/](https://ipfs.io/ipns/docs.ipfs.io/guides/examples/snapshots/)

    [https://digiday.com/media/wtf-link-rot/](https://digiday.com/media/wtf-link-rot/)

    [https://github.com/pirate/ArchiveBox/wiki/Web-Archiving-Community#Reading-List](https://github.com/pirate/ArchiveBox/wiki/Web-Archiving-Community#Reading-List)

> P2P filesystem: distributed systems in which all nodes have identical capabilities and responsibilities, and all communication is symmetric.

> Control how data is stored and retrieved

> orthogonal API

> Event-driven OS

> Repository

> Cloud data offline cryptés

> Unix is heavily based on the filesystem concept; almost everything in Unix can be treated as a file.

> The kernel builds a structured filesystem on top of unstructured hardware, and the resulting file abstraction is heavily used throughout the whole system.

> Linux supports multiple filesystem types: different ways of organizing data on the physical medium.

> Linux supports **filesystem module**, whose software interface declares the different operations that can be performed on a filesystem inode, directory, file, and superblock.

> A filesystem type determines how information is organized on a block device in order to represent a tree of directories and files.

> Such an entity is not a device driver, in that there’s no explicit device associated with the way the information is laid down
the filesystem type is instead a software driver, because it maps the low-level data structures to high-level data structures. It is the filesystem that determines how long a filename can be and what information about each file is stored in a directory entry.

> The filesystem module must implement the lowest level of the system calls that access directories and files, by mapping filenames and paths (as well as other information, such as access modes) to data structures stored in data blocks. Such an interface is completely independent of the actual data transfer to and from the disk (or other medium), which is accomplished by a block device driver.

> databases are usually implemented on top of the filesystem

> Files are a fundamental building block of storage

> a file is a sequence of bytes

> files in IPFS are content-addressed and immutable

> a persistent content addressed storage layer

[https://doc.rust-lang.org/std/fs/index.html](https://doc.rust-lang.org/std/fs/index.html)

- **Linux System Calls**

    [http://linasm.sourceforge.net/docs/syscalls/filesystem.php](http://linasm.sourceforge.net/docs/syscalls/filesystem.php)

    **File Management System Calls**

    **creat** — Obselete way to create a new file

    **mknod** — Create a regular, special, or discovery i-node

    **open** — Open a file for reading, writing or both

    **close** — Close an open file

    **read** — Read data from a file into a buffer

    **write** — Write data from a buffer into a file

    **lseek** — Move the file pointer

    **stat** — Get a file's status information

    **fstat** — Get a file's status information

    **dup** — Allocate a new file descriptor for an open file

    **pipe** — Create a pipe

    **ioctl** — Perform a special operation on a file

    **access** — Check a file's accessibility

    **rename** — Give a file a new name

    **fcntl** — File locking and other operations

    **Directory Management system Calls**

    **mkdir** — Create a new directory

    **rmdir** — Remove an empty directory

    **link** — Create a new entry, name2, pointing to name1

    **unlink** — Remove a directory entry

    **mount** — Mount a file system

    **umount** — Unmount a file system

    **sync** — flush all cached blocks to the disk

    **chdir** — Change the working directory

    **chroot** — Change the root directory

[https://medium.com/@karti/how-the-filesystem-can-become-a-more-powerful-abstraction-45e9d76fa9a6](https://medium.com/@karti/how-the-filesystem-can-become-a-more-powerful-abstraction-45e9d76fa9a6)

[https://www.techrepublic.com/article/bye-bye-files-and-folders-is-the-file-system-about-to-be-killed-off-by-google-ai/](https://www.techrepublic.com/article/bye-bye-files-and-folders-is-the-file-system-about-to-be-killed-off-by-google-ai/)

When a user will push thier data files via Linnia, the data will be processed this way:

1. Metadata analysis and storage (creation of a metadata structure) in an easily searchable database (e.g. PostgreSQL [[26](https://en.wikipedia.org/wiki/PostgreSQL)]),
2. Quality scoring computation (IRIS) either on-chain or off-chain with proof of computation,
3. Permissions setting (none, by default),
4. Encrypted file and its metadata are stored, for example, on IPFS,
5. Update of the mapping table of the database in (1.) with the corresponding IPFS hash newly generated.

Mount

fdisk

Mkfs

cd ..

- **File Browser**

    [https://github.com/jarun/nnn](https://github.com/jarun/nnn)

    [https://github.com/ranger/ranger](https://github.com/ranger/ranger)

Operating Systems should give UUID to every resources

- **UEFI**

    is the new BIOS

- **GUID Partition Table (GPT)**
    - is the new MBR
    - using unique paritiion identifier GUID

**Algorithms Behind Modern Storage Systems**

https://queue.acm.org/detail.cfm?id=3220266

[https://en.wikipedia.org/wiki/Semantic_file_system](https://en.wikipedia.org/wiki/Semantic_file_system)

[https://en.wikipedia.org/wiki/Semantic_Web](https://en.wikipedia.org/wiki/Semantic_Web)

**TMSU**

[https://tmsu.org/](https://tmsu.org/)

[https://en.wikipedia.org/wiki/Tagsistant](https://en.wikipedia.org/wiki/Tagsistant)

scale-out file systems.

But, these systems bottlenecked because one node alone is responsible for metadata and IO routing.

The next step was the addition of parallel file systems, where more or all nodes could manage metadata and IO. 

These parallel file systems are now common across the HPC landscape.

**Storage Abstraction**

[https://www.youtube.com/watch?v=OFQxuZMZsJU](https://www.youtube.com/watch?v=OFQxuZMZsJU)

**Semantic file systems** are [file systems](https://en.wikipedia.org/wiki/File_system) used for information persistence which structure the data according to their [semantics](https://en.wikipedia.org/wiki/Semantics) and intent, rather than the location as with current file systems. It allows the data to be addressed by their content (associative access).
Traditional hierarchical file-systems tend to impose a burden, for example when a sub-directory layout is contradicting a user's perception of where files would be stored. Having a tag-based interface alleviates this hierarchy problem and enables users to query for data in an intuitive fashion.

Semantic file systems raise technical design challenges as indexes of words, tags or elementary signs of some sort have to be created and constantly updated, maintained and cached for performance to offer the desired random, multi-variate access to files in addition to the underlying, mostly traditional block-based filesystem.

---

## Block

[https://www.dcache.org/manuals/2012/workshop/slides/chris-block-devices.pdf](https://www.dcache.org/manuals/2012/workshop/slides/chris-block-devices.pdf)

- The blocks of a given “device” have usually the same size.
- blocks are directly addressable, that is randomly accessible
- The contents of a block may be directly accessible or not. For block-organised
storage media, the former is usually the case.

smallest block size is 512 B

## File namespace (memory is a big graphQL)

case sensistive

namespace distributed hash table

Kernel Clustering of namespaces and resources /net /proc /

computable namespaces

file service protocol

**Namespaces** [https://en.wikipedia.org/wiki/Namespace](https://en.wikipedia.org/wiki/Namespace)

[https://www.eecs.harvard.edu/margo/papers/hotos09/paper.pdf](https://www.eecs.harvard.edu/margo/papers/hotos09/paper.pdf)

/<userId>/profilepicture

## Metadata

*everything you can ever want to know about a file (added by programs as Microsoft Words)*

a new file system architecture in which we replace the hierarchical namespace with a tagged, search-based one

One might want to access a picture, for instance, based on who is in it, when it was taken, where it was taken, etc. Applications interacting with such libraries have evolved external tagging mechanisms to deal with this problem.

cid: content id

content: format_binary: 0x44B7654A3

attribute (type): directory / file

size

type

tags

authors

permissions: Read - Write - Execute 

created_at: DATE

created_by: <user_id>

format: mp3

checksum: sha256

tags: <lol><lilo>

next: —> anchor new version

prev: —> anchor old version

## Directory

https://ux.stackexchange.com/questions/80767/is-the-folder-structure-dying

---

BitTorrent’s architecture was oriented to :

[http://bittorrent.org/bittorrentecon.pdf](http://bittorrent.org/bittorrentecon.pdf)

- providing a way to share already packed resources
- not addressing problems like duplicity and granularity on content discovery.

### **FUSE mounted writable FS FUSE Filesystem**

[https://discuss.ipfs.io/t/mount-ipfs-as-writable-filesystem/439](https://discuss.ipfs.io/t/mount-ipfs-as-writable-filesystem/439)

[https://github.com/ipfs/go-ipfs/issues/1007](https://github.com/ipfs/go-ipfs/issues/1007)

[https://discuss.ipfs.io/t/fuse-mountpoint-mini-faq/312](https://discuss.ipfs.io/t/fuse-mountpoint-mini-faq/312)

### Ethereum swarm

**Swarm** is a storage layer integrated with the Ethereum blockchain to provide economic incentives. Swarm's core storage component is an immutable content addressed chunkstore rather than a generic DHT

[http://swarm-gateways.net/bzz:/theswarm.eth/](http://swarm-gateways.net/bzz:/theswarm.eth/)

[http://swarm-gateways.net/bzz:/theswarm.eth/ethersphere/orange-papers/1/sw%5E3.pdf](http://swarm-gateways.net/bzz:/theswarm.eth/ethersphere/orange-papers/1/sw%5E3.pdf)

### **Merkle Tree**

[https://media.consensys.net/ever-wonder-how-merkle-trees-work-c2f8b7100ed3](https://media.consensys.net/ever-wonder-how-merkle-trees-work-c2f8b7100ed3)

https://arstechnica.com/information-technology/2018/07/the-beos-filesystem/

[https://datprotocol.github.io/how-dat-works/#future-of-dat](https://datprotocol.github.io/how-dat-works/)

[https://storj.io/](https://storj.io/)

### UnixFS v2

[https://github.com/ipfs/unixfs-v2/pull/2/files/1dfbcc1c397d25eb9cfe658ac560caaa1e99400f#diff-e8cd9c1cd7d648d99d1df69f6263ab48](https://github.com/ipfs/unixfs-v2/pull/2/files/1dfbcc1c397d25eb9cfe658ac560caaa1e99400f#diff-e8cd9c1cd7d648d99d1df69f6263ab48)

[https://github.com/ipld/ipld-examples/tree/master/unixfs](https://github.com/ipld/ipld-examples/tree/master/unixfs)

*Note: we are currently designing an updated version of UnixFS that will be [IPLD](https://ipld.io/)-compatible. You can follow along or participate [on GitHub](https://github.com/ipfs/unixfs-v2)*

[https://discuss.ipfs.io/t/file-systems-chunk-small-files-big-files/343/4](https://discuss.ipfs.io/t/file-systems-chunk-small-files-big-files/343/4)

A file in IPFS isn’t just content. It might be too big to fit in a single block, so it needs metadata to link all its blocks together. It might be a symlink or a directory, so it needs metadata to link to other files. UnixFS is the data format used to represent files and all their links and metadata in IPFS, and is loosely based on how files work in Unix. When you add a *file* to IPFS, you are creating a block (or a tree of blocks) in the UnixFS format.

UnixFS is a [protocol-buffers](https://developers.google.com/protocol-buffers/)-based format. You can find the definitions for it at: [https://github.com/ipfs/go-unixfs/blob/master/pb/unixfs.proto](https://github.com/ipfs/go-unixfs/blob/master/pb/unixfs.proto).

### **Mutable File System (MFS)**

*Because files in IPFS are content-addressed and immutable, they can be complicated to edit.*

[https://www.youtube.com/watch?v=FX_AXNDsZ9k](https://www.youtube.com/watch?v=FX_AXNDsZ9k)

Mutable File System (MFS) is a tool built into IPFS that lets you treat files like you would a normal name-based filesystem — you can add, remove, move, and edit MFS files and have all the work of updating links and hashes taken care of for you.

MFS is accessed through the `[files](https://ipfs.io/ipns/docs.ipfs.io/reference/api/cli/#ipfs-files)` commands in the IPFS CLI and API.

### File System

[https://fr.wikipedia.org/wiki/Syst%C3%A8me_de_fichiers](https://fr.wikipedia.org/wiki/Syst%C3%A8me_de_fichiers)

[https://en.wikipedia.org/wiki/Comparison_of_file_systems](https://en.wikipedia.org/wiki/Comparison_of_file_systems)

- **SFS**

    [https://en.wikipedia.org/wiki/Self-certifying_File_System](https://en.wikipedia.org/wiki/Self-certifying_File_System)

- **FAT32**
- **NTFS**
- **HPF+**

    [http://www.osnews.com/story/30743/Apple_File_System_reference](http://www.osnews.com/story/30743/Apple_File_System_reference)

- **EXT3**

    [https://en.wikipedia.org/wiki/Unix_filesystem](https://en.wikipedia.org/wiki/Unix_filesystem)

- **ISO9660 - CD-ROM FS**
- **ISO/IEC 13346 - DVD/BluRay**

### Distributed file system

[https://en.wikipedia.org/wiki/Clustered_file_system#Distributed_file_systems](https://en.wikipedia.org/wiki/Clustered_file_system#Distributed_file_systems)

Distributed filesystems generally allow the function of each piece of their infrastructure to be split across multiple machines for performance, scalability, or fault tolerance. What that looks like in practice depends on the specific file system implementation 

- **Ceph**
- **GlusterFS**
- **LizardFS**
- **MooseFS**