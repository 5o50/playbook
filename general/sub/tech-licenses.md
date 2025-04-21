title: Software Licenses
tags: legal
License
This is pretty much precisely what the GNU GPL is for, it forces forkers to let you merge their changes back in if they release them, giving you the improvements they made plus your own.
Free is not enough â€“ free software must compete. When it comes to attracting consumers, an OS must support the newest games, graphics hardware, attract non-free software developers and keeping the UI at the aesthetic forefront. GNU/Linux distributions generally lag behind the non free OSes on all these points â€“ sometimes far behind.
LICENSING
https://code.blender.org/2019/06/blender-is-free-software/
https://www.gnu.org/philosophy/freedom-or-power.en.html
AGPLv3
https://a16z.com/2014/02/14/why-there-will-never-be-another-redhat-the-economics-of-open-source/
https://medium.com/@lkanies/should-you-open-source-your-product-thats-the-wrong-question-a8cac737c0ca
https://www.youtube.com/watch?v=n9YDz-Iwgyw
https://www.gnu.org/philosophy/free-sw.html
https://dwheeler.com/oss_fs_why.html#fears
http://www.catb.org/~esr/writings/magic-cauldron/
http://www.itmanagersjournal.com/
https://www.joelonsoftware.com/2002/06/12/strategy-letter-v/
GNU GPLv2. GPLv3 ? Affero ?
https://www.gnu.org/licenses/gpl-faq.en.html
https://www.gnu.org/proprietary/proprietary-surveillance.en.html#SpywareOnMobiles
Tivoization
https://www.youtube.com/watch?v=WNknNScP0tg
Vendor Lock-in
https://lwn.net/Articles/582242/
sell both a Lock-in device and unlocked device.
https://nextcloud.com/blog/why-the-agpl-is-great-for-business-users/
https://ez.no/Blog/Enterprise-Open-Source-vs-Project-based-Open-Source-Part-1
https://opensource.stackexchange.com/questions/1255/how-is-selling-floss-packages-for-monetary-compensation-a-viable-strategy/1256#1256
MIT to GPL
https://softwareengineering.stackexchange.com/questions/105912/can-you-change-code-distributed-under-the-mit-license-and-re-distribute-it-unde
https://blog.p2pfoundation.net/why-apache-defeated-the-gpl-license-developer-freedom-vs-user-freedom/2013/01/21
stallman
https://www.youtube.com/watch?v=Rvf25rtUynw
https://en.wikipedia.org/wiki/Vendor_lock-in
noos is Free Software
GPLv2 vs GPLv3
tivoization
https://en.wikipedia.org/wiki/Tivoization
Linus Torvalds said he was "pretty pleased" with the new draft's stance on DRM.[18] However, he still does not support relicensing the Linux kernel under GPLv3, stating that:[19]
Stallman
 calls it "tivoization", but that's a word he has made up, and a term I 
find offensive, so I don't choose to use it. It's offensive because Tivo
 never did anything wrong, and the FSF even acknowledged that. The fact 
is that they do their hardware and have some DRM issues with the 
content producers and thus want to protect the integrity of that 
hardware.
The kernel license covers the kernel. It does not cover boot 
loaders and hardware, and as far as I'm concerned, people who make their
 own hardware can design them any which way they want. Whether that 
means "booting only a specific kernel" or "sharks with lasers", I don't 
care.
strategy
commoditize what your competitors make.
"Free as in Freedom"
our operating system is licensed under the GNU GPLv3
You are correct, selling FOSS packages for money is generally a bad
idea: someone else will come along, promoting their free distribution,
and take all your customers away. This is not a very viable business
strategy.
However, what you can do is 
sell peripherals: little extra bits that nobody else has, that people will think are worthwhile paying for. This includes:
the phone + the OS securely tights
support
'premium' features, whatever they are in your case
plugins
priority development (if you pay, I'll dev your request first)
enterprise integration services (sounds posh, really just means installing it for a company)
The last of these is especially of note. Companies are usually fairly willing to pay someone who knows the software (such as the developer) to install it for them, so that they know it's done right.
Another way to earn money for developing FLOSS is by getting paid by
companies that stand to benefit from it. One example is IBM. IBM is in
the server business and it is in their interest to have a free, reliable and powerful OS to run on their systems. Therefore it made sense for
IBM to pay people to develop a fork of Linux for their own servers as
well as contributing to the main kernel development itself.
You can probably imagine an open source version of CAD software being developed by some large engineering firm in a similar way. Not because
of any altruistic reasons but because they stand to benefit from a
powerful piece of CAD software without expensive licenses attached to
it.
Another way is to look at open source software like scientific
research. Scientists are compensated by government and non-profit
organizations to support their work. A good example of this is the
Mozilla Foundation which funds development of the Firefox web browser.
Scientific discoveries are considered a public good which benefits
everyone which is why we fund them. An efficient general purpose web
browser can be thought the same way.
I will answer the best I can. There are basically three distinct
models I have had personal or professional experience with. I am a
software developer, and thus my experience comes from that realm.
First, when making a profit on Opensource software, some times that
profit comes from including that software in a larger package. For
example, one of my clients used a Open source Credit card processing
Library, to handle all their credit card processing. And while that
client makes money off the library, that library is just part of the
larger business model. To "give back" that client paid to have me write
code that was pushed back to the library extending it's functionality.
So the Library prospered, and the client's business prospered.
Second, the sale of services. Websites for example, run on Linux
Servers (again for example). The providers of the servers (Lets say
Linode) don't sell Linux but they sell their VPS hosting and
management/support. Their business prospers by use of FOSS, and the FOSS prospers by gaining more server market share.
Third, By selling convenience. Any time a package or setup of FOSS is hard to do, selling the convenience of having it already setup is
warranted. See http://docs.aws.amazon.com/AmazonDevPay/latest/DevPayDeveloperGuide/EC2PaidAMI.html for a common example. Your not really selling the packages themselves
but the convenience of having them setup in a specific way. By extension I have seen some sell pre-compiled versions of their software while the source code is still covered under a FOSS licence. Growl for mac used
to be under such a license.
Side Note: Many times a commercial open source application is Dual
Licenced. For "free" you get the Open source version and a "agreement"
that you will, in turn for using the code, "help out" in some way
(submit bugs, write patches, tout applications etc.), or a more
"restricted" license that you pay for but then don't have to "help out". For many companies it may be cheaper to by the "commercial" license
then to "have to" publish source code back to the authors or to the
people using the app.
So, to wrap things up, your specific answer is the third. Selling the convenience of a pre-setup package over a "configure it your self"
package usually warrants monetary compensation. Using this method it's
important to remember that "Your going to pay someone" rather it's your
staff via training or support, the package maintainer, or the Support
company (RHEL for example). Paying for the package is sometimes cheaper
then the other two. Usually a company that decides to go this route
offers "support" in addition to the sale of the pre-configured system.
Support is a much more profitable sale, but you can sell just the
package, but most people paying for a package will want some kind of
support.
https://en.wikipedia.org/wiki/Comparison_of_open-source_and_closed-source_software