# Data model

https://en.wikipedia.org/wiki/Data_model

https://search.google.com/structured-data/testing-tool/
https://github.com/ipld/specs/blob/master/graphsync/graphsync.md
https://schema.org/docs/schemas.html
https://github.com/ipld/ipld/issues/39

https://json-ld.org/

A data model is a particular representation of some data.
It specifies a subject for the representation, attributes, and groups everything together based on the relationship of the attributes to the subject.

Let's take a look at an example. Suppose that people is our subject. Furthermore, country of residence, continent, and region, are the attributes we are interested in. In this case, the data model would be people and their geographic location.

# Data Model - Define the Data

[https://github.com/ipfs/specs/tree/master/dweb-addressing](https://github.com/ipfs/specs/tree/master/dweb-addressing)

[https://www.graphiti.dev/guides/](https://www.graphiti.dev/guides/)

[https://graphql.org/learn/](https://graphql.org/learn/)

[http://webdam.inria.fr/Alice/](http://webdam.inria.fr/Alice/)

---

[https://medium.com/towardsblockchain/understanding-ipfs-in-depth-2-6-what-is-interplanetary-linked-data-ipld-c8c01551517b](https://medium.com/towardsblockchain/understanding-ipfs-in-depth-2-6-what-is-interplanetary-linked-data-ipld-c8c01551517b)

[https://www.youtube.com/watch?v=Bqs_LzBjQyk](https://www.youtube.com/watch?v=Bqs_LzBjQyk)

[https://www.youtube.com/watch?v=Bqx6li5dbEY](https://www.youtube.com/watch?v=Bqx6li5dbEY)

[http://www.xanadu.net/](http://www.xanadu.net/)

> The world is a system of everchanging relationships and structures

> Interconnection and expressing that interconnection

> Expressing, representing and showing interconnections amongs media

[https://juxt.pro/blog/posts/value-of-bitemporality.html](https://juxt.pro/blog/posts/value-of-bitemporality.html)

- **Data**
    - **Two major differences between Enigma and Keep:**

        Keep is working on a narrow approach rather than build a grand approach to “private smart contracts”. Keep focuses on mitigating attacks such as Sybil attacks [[5](https://en.wikipedia.org/wiki/Sybil_attack)] while Enigma risks of having a large attack surface because of the private smart contracts platform which creates bigger attack surface.

        On the other hand, Enigma's unique technology of private smart contracts allows the code itself to be run off-chain when it needs to be private and the nodes running these private contracts to prove they have executed correctly the contract. On the technical side, Keep is building on-chain Random Number Generators (RNG) while both Enigma and Keep use SMPC (Secure MultiParty Computation) to query data and compute over it in a distributed way. Data will be stored using decentralized solutions for both of these projects.

    - Linnia/Stow

        [https://github.com/ConsenSys/Linnia-Smart-Contracts](https://github.com/ConsenSys/Linnia-Smart-Contracts)

    - **Ocean**

        [https://oceanprotocol.com/tech-whitepaper.pdf](https://oceanprotocol.com/tech-whitepaper.pdf)

        The Ocean Protocol includes a protocol that makes use of **curation markets** to categorize the value of encrypted data in order to enable a **decentralized data marketplace**.

    - **Keep network**

        [https://backend.keep.network/whitepaper](https://backend.keep.network/whitepaper)

        Keep is an **off-chain container for private data which allows contracts to manage and use private data without exposing it the public blockchain in order to execute operations over this data**. The data is published encrypted on the blockchain and computation will be delegated to the Keep network, the result afterwards will be published again to be reviewed on the blockchain. Keep focuses on executing calculation over encrypted data, Linnia on the other hand has a broader approach where the computation represents only one part of the project and it would be interesting if Linnia could use Keep as its computation network.

    - **Rockchain**

        [https://rockchain.org/RockchainWhitePaper.pdf](https://rockchain.org/RockchainWhitePaper.pdf)

        Rockchain is an infrastructure project that interacts with the Ethereum blockchain. Their infrastructure **provides access rights to control distributed data and computation results**. Rockchain is not a UX-oriented project and will probably focus on its infrastructure for the next few years. Linnia is a binder, an enabler for interoperability and a UX-oriented project. For these reasons, we believe that Linnia could use Rockchain in its lower layers as a storage and computing component in order to increase the diversity of the Linnia Mesh with vetted outside support. We will discuss the Linnia Mesh in the last part of this paper.

- **Database & Datastore**

    [https://stackoverflow.com/questions/49985755/what-is-the-difference-between-orbitdb-based-on-ipfs-and-gun](https://stackoverflow.com/questions/49985755/what-is-the-difference-between-orbitdb-based-on-ipfs-and-gun)

    [https://blog.yourlabs.org/post/184290880553/storing-hd-photos-in-a-relational-database-recipe](https://blog.yourlabs.org/post/184290880553/storing-hd-photos-in-a-relational-database-recipe)

    [https://cstack.github.io/db_tutorial/](https://cstack.github.io/db_tutorial/)

    [https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Distributed_database.html](https://ipfs.io/ipfs/QmXoypizjW3WknFiJnKLwHCnL72vedxjQkDDP1mXWo6uco/wiki/Distributed_database.html)

    - **GunDB**

        [https://github.com/amark/gun](https://github.com/amark/gun)

        [https://gun.eco/#step1](https://gun.eco/#step1)

    - **OrbitDB (over IPFS)**

        [https://news.ycombinator.com/item?id=18748542](https://news.ycombinator.com/item?id=18748542)

        [https://medium.com/tallylab/pushing-the-limits-of-ipfs-and-orbitdb-c86c8512ef2f](https://medium.com/tallylab/pushing-the-limits-of-ipfs-and-orbitdb-c86c8512ef2f)

        [https://medium.com/coinmonks/orbitdb-a-peer-to-peer-database-for-the-decentralized-web-30bac1d056fe](https://medium.com/coinmonks/orbitdb-a-peer-to-peer-database-for-the-decentralized-web-30bac1d056fe)

        [https://medium.com/@rossbulat/orbitdb-deploying-the-distributed-ipfs-database-with-react-79afa1a7fabb](https://medium.com/@rossbulat/orbitdb-deploying-the-distributed-ipfs-database-with-react-79afa1a7fabb)

        [https://github.com/orbitdb/orbit-db](https://github.com/orbitdb/orbit-db)

    - **Bluezelle**

        [https://docs.bluzelle.com/developers/](https://docs.bluzelle.com/developers/)

    - **PostgresSQL**

        [https://en.wikipedia.org/wiki/PostgreSQL](https://en.wikipedia.org/wiki/PostgreSQL)

    - **LevelDB**
    - **RocksDB**

    [https://blog.bluzelle.com/ipfs-is-not-what-you-think-it-is-e0aa8dc69b](https://blog.bluzelle.com/ipfs-is-not-what-you-think-it-is-e0aa8dc69b)

- **Application DB**

    ![](Untitled-5698200f-1743-4d38-b8ce-56f90f94ecfe.png)

    ![](Untitled-8944d5b0-996a-41a7-a979-030dad9f197f.png)

    ![](Untitled-d510edc7-ccb7-45b3-9881-942a98899476.png)

    ![](Untitled-246624fe-7f4a-44a8-b957-9249556db78d.png)

[https://news.ycombinator.com/item?id=17176803](https://news.ycombinator.com/item?id=17176803)

[https://discuss.ipfs.io/t/list-all-items-stored-on-ipfs-and-corresponding-hash-value/427/2](https://discuss.ipfs.io/t/list-all-items-stored-on-ipfs-and-corresponding-hash-value/427/2)

[https://github.com/textileio/go-textile](https://github.com/textileio/go-textile)

[https://github.com/textileio/go-textile/wiki](https://github.com/textileio/go-textile/wiki)

- **IPLD**

    [https://ipld.io](https://ipld.io/)

- **RealTime Collaboration — Shared Editing**

    [https://www.youtube.com/watch?v=-kdx8rJd8rQ](https://www.youtube.com/watch?v=-kdx8rJd8rQ)

    [https://github.com/ipfs-shipyard/shared-editing-demo](https://github.com/ipfs-shipyard/shared-editing-demo)

    [https://www.youtube.com/channel/UCdjsUXJ3QawK4O5L1kqqsew](https://www.youtube.com/channel/UCdjsUXJ3QawK4O5L1kqqsew)

- **Semantic Content**

    microformats allow the encoding and extraction of event details, contact information, social relationships and similar information.
    content of web pages has been capable of some "automated processing"
    processing is difficult because the markup tags used to display information on the web do not describe what the information means.

    Microformats can bridge this gap by attaching semantics, and thereby obviate other, more complicated, methods of automated processing, such as natural language processing or screen scraping. The use, adoption and processing of microformats enables data items to be indexed, searched for, saved or cross-referenced, so that information can be reused or combined.

[https://www.slideshare.net/ronniemitra/five-api-styles](https://www.slideshare.net/ronniemitra/five-api-styles)

[https://odino.org/hypermedia-services-beyond-rest-architectures/](https://odino.org/hypermedia-services-beyond-rest-architectures/)

**Data-centric API**

https://martinfowler.com/bliki/CQRS.html

# **Fingerprinting**

So, first things first, to support content addressing, we need to come up with some way to create a ‘fingerprint’ or summary of the content that we can use to reference said content. Similarly to finding a book, where we use ISBN numbers. In practice, content addressing systems on the web such as IPFS use cryptographic hashing functions to create fingerprints. Basically, we take the raw content (in this case, a cat photo), and run that data through a [hash function](https://en.wikipedia.org/wiki/Hash_function), to produce a digest. This digest is guaranteed to be cryptographically unique to the contents of the file (or image or whatever), and that file only. If I change that file by even one bit, the hash will become something completely different.

From raw image to cryptographic digest to content id (multihash).

So we’ve hashed out image (created a digest), now what? We’ll, what we’re after is a content address/identifier. So we need to now take that digest, and convert it into something that IPFS and other systems can use to locate it… but this is not all that simple. What if things change in the future, and we want to change the way we address content? What if someone invents a better hash function? Even the IP system we have now has had to undergo upgrades. We’ll the good folks at IPFS have thought of this too!

# **Multihashing**

Have you ever noticed that IPFS hashes all seem to start with `Qm`? This is because those hashes are actually something called a [multihash](https://multiformats.io/multihash/). This is cool, because the hash itself specifies which hash function it used, and the length of the resultant hash in the first two bytes of the multihash. In most of our examples, the first part in hex is 12, where 12 denotes that this is the `[SHA256`hash function](https://en.wikipedia.org/wiki/SHA-2), and the output length is 20 in hex (or 32 bytes)… which is where we get the `Qm` from when we [base58 encode](https://en.wikipedia.org/wiki/Base58) the whole thing. So then you might ask, why base58 encode the whole thing? Well, because similar-looking letters are omitted: 0 (zero), O (capital o), I (capital i) and l (lower case L), and non-alphanumeric characters + (plus) and / (slash) are dropped, making it slightly more human readable. And all of this because we want a future-proof system that allows for multiple different fingerprinting mechanisms to coexist. So if that awesome new hashing function does get invented, we’ll simple change the first few bytes of the multihash, and voila… IPFS hashes no longer start with `Qm…` but because we are using multihashes, the old ones will still work, along *with* the new ones… cool!

# **Merkle DAG ➞ IPLD**

Ok, so I’ve got my file, I’ve hashed and encoded it. But that’s not really the whole story. What is *actually* happening is something more like this…

![](https://cdn-images-1.medium.com/max/1600/1*47aWoFnX2SqRda94YXCcnw.png)

Large files are chunked, hashed, and organized into an IPLD (Merkle DAG object).

The content is chunked up into smaller parts (about 256k each), each part is hashed, a CID is created for each chunk, and then these chunks are combined into a hierarchical data structure, for which a single, base CID is computed.This data structure is essentially something called a [Merkle DAG](https://en.wikipedia.org/wiki/Merkle_tree), or [directed acyclic graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph).

Here’s an awesome video of Juan Benet of protocol labs explaining how IPFS uses Merkle DAGs as their core data structure… for what is called the [Interplanetary Linked Data (or IPLD)](https://ipld.io/) structure:

# **Linked Data**

Linked data is actually something that folks in the decentralized web community have been talking about for quite some time. It’s something Tim Berners-Lee has been working on for ages, and his new company, [Solid](https://solid.mit.edu/), is building a business around it.

Essentially what we are talking about, is a structure that models everything as a series of linked objects. In the IPLD world, we have objects, each with `Data`and `Links` fields (where `Data` can be a small blob of unstructured, arbitrary binary data, and `Links` is an array of `Link` structures, which are simply links to other IPFS objects). Speaking of which, `Links` each have a `Name`, a `Hash`(or CID) of the linked object, and a `Size`, which represents the size of the linked object. This last bit of info is really just so we can estimate object/file sizes without having to pre-fetch too much data, but it’s extremely useful to have.

IPLD (objects)

- `Data` — blob of unstructured binary data of size < 256 kB.
- `Links` — array of Link structures. These are links to other IPFS objects.

A Link structure has three data fields

- `Name` — name of the Link
- `Hash` — hash of the linked IPFS object
- `Size` — cumulative size of linked IPFS object, including following *its* links

---

[https://medium.com/textileio/whats-really-happening-when-you-add-a-file-to-ipfs-ae3b8b5e4b0f](https://medium.com/textileio/whats-really-happening-when-you-add-a-file-to-ipfs-ae3b8b5e4b0f)

manage the operations of the computer itself, resources and all parts of the system

[https://martinfowler.com/bliki/CQRS.html](https://martinfowler.com/bliki/CQRS.html)

![](Untitled-6ce4257d-a474-49db-ab24-68a9f5efd9a4.png)

- **CRDT**

    [https://en.wikipedia.org/wiki/Conflict-free_replicated_data_type](https://en.wikipedia.org/wiki/Conflict-free_replicated_data_type)

[https://github.com/ipfs/unixfs-v2/pull/2/files/1dfbcc1c397d25eb9cfe658ac560caaa1e99400f#diff-e8cd9c1cd7d648d99d1df69f6263ab48](https://github.com/ipfs/unixfs-v2/pull/2/files/1dfbcc1c397d25eb9cfe658ac560caaa1e99400f#diff-e8cd9c1cd7d648d99d1df69f6263ab48)

[https://github.com/ipld/ipld](https://github.com/ipld/ipld)