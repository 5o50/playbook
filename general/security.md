1. what do you want to secure ?
2. from what ?
3. does the risk worth the need ?

- **#3 CONFIDENTIALITY - INTEGRITY - AVAILABILITY**
    confidentiality, integrity, and availability, which are often referred to as the CIA triad for information security

e2e encryption
https://secushare.org/end2end#header

https://copperhead.co/blog/secure-phone-series-device-security/
https://old.reddit.com/r/geoguessr/comments/jzw628/help_me_find_this_obelisk_in_remote_utah/gdfbzee/
https://www.bellingcat.com/
https://www.forbes.com/sites/thomasbrewster/2021/02/08/can-the-fbi-can-hack-into-private-signal-messages-on-a-locked-iphone-evidence-indicates-yes/
https://old.reddit.com/r/OSINT/

diceware to generate passphrase
https://www.useapassphrase.com/
https://theworld.com/~reinhold/diceware.html

https://www.explainxkcd.com/wiki/index.php/936:_Password_Strength

Secure Architecture
STATE OF THE ART
Processors
Security starts at the processor. A foundation of root-of-trust must be established to provide security services upon which to build a robust security environment. Todayâ€™s mainstream processors typically include the hooks and features needed to support a robust security strategy.
BIOS
The next layer of defense is at the Basic Input/Output System (BIOS) level. Attacks on the BIOS are growing with reports of intrusions becoming more common. The National Institute of Standards and Technology (NIST) provides security guidelines for updating BIOS, the point at which the security threat is the greatest. Through these security guidelines â€“ NIST SP 800-147, NIST is setting standards that require authentication of BIOS upgrade mechanisms.
BIOS providers have taken the security challenge seriously and offer suites of products providing multiple levels of security. They support the latest processor technology, which allows users to manage, inventory, diagnose, and repair their systems in efficient, remote, and streamlined ways all without compromising system security. The BIOS providers support the NIST SP 800-147 guidelines and they offer multiple other security options to protect FLASH and other storage devices. Users prefer to keep as much of the security responsibility at the hardware and BIOS level as possible because that is where the defense is strongest.
Operating system
Operating systems play many roles in providing increased levels of security. The most recent advancement became more feasible with the introduction ofÂ multicoreÂ processors that enable the ability to run multiple instances of operating systems on one multicore processor. This has led toÂ hypervisorÂ architectures that can protect key elements of the software environment (Figure 2). Operating systems must address:
Authentication â€“ the process of ensuring that users, devices and software on aÂ network are correctly identified.
Authorization â€“ grants users and devices the right to access resources and perform specified actions.
Network Access Control â€“ mechanisms that limit access to the network to authenticated and authorized devices, software and users.
Confidentiality â€“ using ciphers to transform data to make it unreadable to anyone except those authorized and authenticated to view the data.
Integrity â€“ checking mechanisms are designed to detect unauthorized changes to transmitted data through the lifecycle of a device, software and data.
Remote Management â€“ aÂ methodÂ to monitor, update and manage remotely manufactured andÂ fielded devices.

Secure SoC -- embedded system
Secure SOC
https://www.edn.com/electronics-blogs/eye-on-iot-/4440308/What-it-takes-to-secure-an-SoC-
Secure Embedded System
Secure Embedded System
http://vcsg.ecs.umass.edu/essg/papers/MOCHASubmit.pdf
From a performance point of view, the processing, the battery and the flexibility gaps have to be considered.
processing gap
highlights that current embedded system architectures are not capable of keeping up with the computational demands of security processing
battery gap
emphasizes that the current energy consumption overheads of supporting security on battery-constrained embedded systems are very high
flexibility gap
shows that an embedded system is often required to execute multiple and diverse security protocols and standards
From an attack point of view, the tamper resistance and the assurance gaps have to be addressed.
tamper resistance gap
emphasizes that secure embedded systems are facing an increasing number of attacks from physical to software attacks
assurance gap
is related to reliability and stresses the fact that secure systems must continue to operate reliably despite attacks
Designing an embedded system architecture dealing with all these requirements is a challenging task.
==> reconfigurable architectures
provide many interesting features to be selected as an efficient solution
===> hardware monitoring to build Intrusion Detection Systems (IDSs)
a new approach to build embedded systems that takes benefit of both reconfigurable architectures and hardware monitors to increase security by detecting abnormal behaviors and by reacting appropriately. Such a solution enables the system to face an unsecured and evolving environment while meeting performance and constraints issues.


Tamper Proof
TAMPER PROOF / or tamper-resistant and tamper-evident
Side channels attacks possible ?
https://electronics.stackexchange.com/questions/56482/encrypt-sensitive-data-in-eeprom
https://www.maximintegrated.com/en/app-notes/index.mvp/id/5421
embedded cryptography is replacing software cryptography for a wider range of services. The very high level of security for financial transactions is a timely example of why and how only embedded cryptography can protect both those systems and their users.
There are several tamper resistant microcontrollers available, but it's important to remember that it's tamper resistant, not tamper proof (no matter what the manufacturer claims). Even without going to the extremes of de-encapsulating the chip it's often still possible to recover a key using side channel attacks such as timing and differential power analysis just from precise measurements of the chip's normal operation. If your opponents are skilled, motivated, and moderately funded, and have unsupervised access to several copies of your system, they will be able to get the key
https://www.cl.cam.ac.uk/~mkb23/research/Survey.pdf
https://en.wikipedia.org/wiki/Tamper_resistance
https://en.wikipedia.org/wiki/Secure_cryptoprocessor
https://opensource.com/article/17/3/iot-security-raspberry-pi
https://www.zymbit.com/securing-raspberrry-pi/
https://www.owasp.org/index.php/Attack_Surface_Analysis_Cheat_Sheet

Hardware Sec Basic
HARDWARE SECURITY BASICS
https://www.youtube.com/watch?v=YfXNqj2-WQk
https://www.youtube.com/watch?v=WOabM3D75r4
https://www.youtube.com/watch?v=IznWRQ3M7jM
https://www.youtube.com/watch?v=4w4mtiy35ks
https://medium.com/ecomi/all-you-need-to-know-about-the-orbis-secure-wallets-security-20a48ad8e297
https://en.wikipedia.org/wiki/Evaluation_Assurance_Level
Data retention time
Interfaces:
Hardware Wallet
https://en.bitcoin.it/wiki/Hardware_wallet
https://bitcointalk.org/index.php?topic=19080.msg272348#msg272348
https://bitcointalk.org/index.php?topic=134277.0
https://github.com/someone42/hardware-bitcoin-wallet
https://github.com/someone42
https://en.bitcoin.it/wiki/How_to_set_up_a_secure_offline_savings_wallet