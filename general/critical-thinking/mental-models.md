**Mental models**

Dec 22, 2016

[http://www.defmacro.org/2016/12/22/models.html](http://www.defmacro.org/2016/12/22/models.html)

These are some mental models I find useful. They’re rooted in decades of experience of thousands of experts – a modern equivalent of folk wisdom. Mental models are useful to quickly and correctly reason about seemingly intractable problems. They require quite a bit of intuition to properly internalize, but once you’ve internalized them they’re relatively easy to apply. They’re also easy to forget in the moment – use this post as a checklist when thinking about complex problems.

This is a living document. Instead of creating an exhaustive list on day one, I will add models as they arise (and as I discover new ones).

**Productivity**

- **The small-improvements method** – the observation that psychologically frequently making small incremental improvements is a better approach than attempting to fix big looming problems once.
- [The just-get-started method](https://www.joelonsoftware.com/2002/01/06/fire-and-motion/) – Joel Spolsky’s observation that just starting to work on a small, concrete, finishable problem puts your consciousness in a productive state.**Corollary:** Just do something concrete. Anything. Do your laundry, or dust the counters, or add a single unit test. Just do something.
- [The top-five-problems method](http://www.cs.virginia.edu/~robins/YouAndYourResearch.html) – Richard Hamming’s algorithm for doing important work. Periodically ask yourself: “what are the top five most important problems in my field (and life), and why am I not working on them?”**Corollary:** What are the top five most important problems in your field (and life), and why aren’t you working on them?
- **The LRU prioritization method** – since you can only work on one problem at a time, it’s usually sufficient to pick the most important problem, work on that, and ignore everything else. This method also works with organizing most things (from email to physical possessions).
- [The teaching method](http://www.pitt.edu/~druzdzel/feynman.html) – Richard Feynman’s observation that teaching the basics is an excellent method for generating profound new ideas, and for putting consciousness in a productive state.**Corollary:** If you’re stuck, put yourself in a position where you have to teach someone the basics.
- [Planning fallacy](https://en.wikipedia.org/wiki/Planning_fallacy) – the observation that humans are overly optimistic when predicting success of their undertakings. Empirically, the average case turns out to be worse than the worst case human estimate.**Corollary:** Be  pessimistic when estimating. Assume the average case will be slightly worse than the hypothetical worst case.**Corollary:** When estimating time, upgrade the units and double the estimate (e.g. convert “one week” to “two months”).

    really

- [Forcing function](https://en.wikipedia.org/wiki/Behavior-shaping_constraint) – an external, usually social, constraint that increases the probability of accomplishing a set of tasks.**Example:** Pair programming.

**Hypothesis evaluation**

- [Efficient market hypothesis](https://en.wikipedia.org/wiki/Efficient-market_hypothesis) – the state of any given issue in the world is  as close to optimal as is currently possible.**Corollary:** It’s unlikely that the status quo can be easily improved without significant resources.**Example:** Cucumber juice probably doesn’t cure cancer.**Example:** The iPhone app you wrote in a weekend probably doesn’t double the phone’s battery life.

    roughly

- [Statistical mechanics](https://en.wikipedia.org/wiki/Statistical_mechanics) – probabalistic systems that follow certain laws in the long run can have perturbations that diverge from these laws in the short run.**Corollary:** Occasionally the status quo  be easily improved without significant resources (but it is unlikely that  found such an occassion).**Idiom:** In the short run the market is a voting machine, but in the long run it is a weighing machine.**Idiom:** If an economist saw a $100 bill on a sidewalk they wouldn’t pick it up (because if it were real, it would have been picked up already).

    can

    you

- [Base rates](https://en.wikipedia.org/wiki/Base_rate) – you can approximate the likelihood of a specific event occurring by examining the wider probability distribution of similar events.**Example:** You’re evaluating the probability of success of a given startup. Ask yourself, if you saw ten similar startups a year, how many of them are likely to succeed?**Example:** You caught an employee stealing, but they claim they need money to buy medication and it’s the first time they’ve ever stolen anything. Ask yourself, if you saw ten employee thefts a year, how many of them are likely to be first offences?**Note:** This method is especially useful to combat [optimism](https://en.wikipedia.org/wiki/Optimism_bias) and [overconfidence](https://en.wikipedia.org/wiki/Overconfidence_effect) biases, or when evaluating outcomes of events you’re emotionally close to.**See also:** [Techniques for probability estimates](http://lesswrong.com/lw/3m6/techniques_for_probability_estimates/), [reference class forecasting](https://en.wikipedia.org/wiki/Reference_class_forecasting), [prior probability](https://en.wikipedia.org/wiki/Prior_probability).
- [Emic vs etic](https://en.wikipedia.org/wiki/Emic_and_etic) (aka inside vs outside view) – two perspectives you can choose when evaluating persuasive arguments. The inside view is time consuming and requires you to engage with the arguments on their merits. The outside view only requires you ask “what kind of person does sincerely believing this stuff turn you into?”**Corollary:** You can  predict correctness of arguments by evaluating superficial attributes of the people making them.**Example:** If someone is wearing funny clothes, purports to know the one true way, and keeps talking about the glorious leader, you can usually dismiss their arguments without deeper examination.**Warning:** This method usually works because most kooky people aren’t innovators, but will misfire in important situations because many innovators initially seem kooky.

    usually

**Decision making**

- **Inversion** – the observation that many hard problems are best solved when they’re addressed backward. In other words figure out what you don’t want, avoid it, and you’ll get what you do want.**Corollary:** Find out how people commonly fail doing what you do, and avoid failing like them.**Example:** If you want to help India, ask “what is doing the worst damage in India and how can we avoid it?”**See also:** [Failure mode](https://en.wikipedia.org/wiki/Failure_mode_and_effects_analysis).
- **Bias for action** – in daily life many important decisions are easily reversible. It’s not enough to have information – it’s crucial to move quickly and recover if you were wrong, than to deliberate indefinitely.**Idiom:** One test is worth a thousand expert opinions.**Idiom:** The best thing you can do is the right thing, the next best thing is the wrong thing, and the worst thing you can do is nothing.**Note:** The best people do this naturally, without brooding, and with a light touch.
- [Expected value](https://en.wikipedia.org/wiki/Expected_value) – a simple model for evaluating uncertain events (multiply the probability of the event by its value).**Corollary:** Sometimes you’ll have to estimate probabilities when it feels really hard to do.**Example:** Chance of winning NY lotto is 1 in 292,201,338 per game. Let’s say the grand prize is $150M and ticket price is $1. Then the expected value is roughly $0.5. Since $0.5 < $1, the model tells us the game isn’t worth playing.**Warning:** Looking at expected value often isn’t enough. You need to consider utility to make good decisions.**See also:** [Techniques for probability estimates](http://lesswrong.com/lw/3m6/techniques_for_probability_estimates/), [shut up and multiply](https://wiki.lesswrong.com/wiki/Shut_up_and_multiply), [scope insensitivity](http://lesswrong.com/lw/hw/scope_insensitivity/).
- [Marginal utility](https://en.wikipedia.org/wiki/Marginal_utility) – the change in utility from the change in consumption of a good. Marginal utility usually diminishes with increase in consumption.**Example:** The first car in your garage improves your life significantly more than the second one.**Example:** Because utility loss from losing a dollar is negligible relative to utility gain from winning NY Lotto at ridiculously low odds, it might be worth buying a ticket even at negative expected value (but seriously, don’t).**Corollary:** Think through your utility function carefully.
- [Strategy](https://en.wikipedia.org/wiki/Strategy) and [tactics](https://en.wikipedia.org/wiki/Tactic_(method)) – empirically decisions tend to fall into one of two categories. Strategic decisions have long-term, gradual, and subtle effects (they’re a gift that keeps on giving). Tactical decisions are encapsulated into outcomes that have relatively quick binary resolutions (success or failure).**Example:** Picking a programming language is a strategic decision.**Example:** Picking a line of reasoning when trying to close a sale is a tactical decision.**Corollary:** Most people misuse these terms (e.g. “we need a strategy for this meeting”).

**People**

- [IQ](https://en.wikipedia.org/wiki/Intelligence_quotient), [RQ](https://doc.research-and-analytics.csfb.com/docView?language=ENG&format=PDF&source_id=csplusresearchcp&document_id=1048541371&serialid=mofPYk1Y4WanTeErbeMtPx6ur0SCIcSlaZ7sKGPdQQU%3D), and [EQ](https://en.wikipedia.org/wiki/Emotional_intelligence) – respectively, intelligence quotient (assessment of the mind’s raw horse power), rationality quotient (assessment of how well the mind’s models map to the real world; a measure of efficiency of the IQ’s application to real problems), and emotional quotient (ability to recognize and label emotions).**Corollary:** brilliant people can be jerks and kooks, empathic people can have wacky ideas about reality, and effective people can have average intelligence.
- [Structure and agency](https://en.wikipedia.org/wiki/Structure_and_agency) – the observation that human behavior derives from a balance of internalized cultural patterns and capacity to act independently. The interaction of these two properties influences and limits individual behavior.**Corollary:** Pay attention to the need for structure and independence in each individual.**Corollary:** Put a structure in front of even the most independent-minded people, and they’ll internalize it.**Corollary:** People often behave the way they believe their [role](https://en.wikipedia.org/wiki/The_Presentation_of_Self_in_Everyday_Life) requires them to (as opposed to the actual requirements of the role).**Corollary:** Pay attention to how people perceive their own roles, and break their expectations with caution.
- [Social status](https://en.wikipedia.org/wiki/Social_status) – the observation (particularly in improv) that social status is so important to humans, that modeling status alone results in extremely realistic performances.**Corollary:** Pay attention to how people perceive their own status, and break their expectations with caution.**See also:** [Self-serving bias](https://en.wikipedia.org/wiki/Self-serving_bias).
- **Controlled vulnerability:** – the observation that humans are attracted to confidently expressed vulnerability in others but are scared to be vulnerable themselves.**Corollary:** Humans feel strong attraction towards others who confidently display vulnerability.**Corollary:** Humans feel a strong desire to [reciprocate](https://en.wikipedia.org/wiki/Reciprocity_(social_psychology)) vulnerability. Vulnerability expression by others gives them a sense of safety to express themselves, followed by a feeling of relief and a strong bond with the counterpary.

**Groups**

- [Mere-exposure effect](https://en.wikipedia.org/wiki/Mere-exposure_effect) – an observation that humans tend to develop a preference for things, people, and processes merely because they are familiar with them. This effect is much stronger than it initially seems.**Corollary:** Merely putting people in a room together repeatedly, giving them a shared direction, symbology, and competition will create a group with very strong bonds.**See also:** [In-group favoritism](https://en.wikipedia.org/wiki/In-group_favoritism).

**Communication**

- [Story arc](http://www.defmacro.org/2015/02/25/startup-ideas.html) – human beings are wired to respond to storytelling. A story arc is a way to structure ideas to tap into this response, typically by describing a change in the world.**Example:** Once upon a time there was ___. Every day, ___. One day ___. Because of that, ___. Because of that, ___. Until finally ___.
- [Writing well](http://www.defmacro.org/2016/12/22/writing-well.html) – use arresting imagery and tabulate your thoughts precisely. Never use a long word where a short one will do. If it’s possible to cut a word out, always cut it out. Don’t hedge – decide what you want to say and say it as vigorously as possible. Of all the places to go next, choose the most interesting.
- [Charitable interpretation](https://en.wikipedia.org/wiki/Principle_of_charity) – interpreting a speaker’s statements to be rational and, in the case of any argument, considering its best, strongest possible interpretation. Charitable interpretation makes conversations (and relationships) go better.
- [Nonviolent Communication](https://en.wikipedia.org/wiki/Nonviolent_Communication) (aka NVC) – a communication framework that allows expressing grievances and resolving conflicts in a non-confrontational way. Structuring difficult conversations as described in NVC makes the process dramatically less painful. NVC contains four components: (1) expressing facts, (2) expressing feelings, (3) expressing needs, and (4) making a request.**Example:** You didn’t turn in the project yesterday. When that happened I felt betrayed. I need to be able to rely on you to have a productive relationship. In the future, could you notify me in advance if something like that happens?

**Policy**

- [Global utility maximization](https://en.wikipedia.org/wiki/Utilitarianism) – our innate sense of fairness is often unsatisfiable, and attemping to satisfy it can occasionally cause much grief in exchange for little gain. It’s much better to optimize for the needs of the many, not for an idealistic notion of fairness.**Corollary:** There are times when it makes sense to be unfair to the individual in the interest of the common good.**Example:** It makes sense to fire an underperforming employee who has valid excuses for their poor performance.**Idiom:** It is the greatest happiness of the greatest number that is the measure of right and wrong.**See also:** [Preference utilitarianism](https://en.wikipedia.org/wiki/Preference_utilitarianism).
- [Tragedy of the commons](https://en.wikipedia.org/wiki/Tragedy_of_the_commons) – a set of circumstances where individuals acting independently in a reasonable manner behave contrary to the common good.**Example:** Tourists taking small artifacts from popular attractions.**Corollary:** Governance is necessary to preserve the common good.
- **Front page test** – an ethical standard for behavior that evaluates each action through the lens of the media/outside world.**Example:** What would happen if HN found out we’re mining our users’s IMs?**Warning:** Incentivizes extreme risk aversion, often without appropriate consideration for potential gain.
- [Reasonable person principle](http://www.cs.cmu.edu/~weigand/staff/) – a rule of thumb for group communication originated in CMU. It holds that reasonable people strike a suitable balance between their own immediate desires and the good of the community at large.**Corollary:** Fire people that are offensive or easily offended. (It usually turns out that people who possess one of these qualities, possess both.)**Note:** unreasonable persons can be extremely valuable in greater society (e.g. journalists, comedians, whistleblowers, etc.), but usually not in small organizations.
- [Overton window](https://en.wikipedia.org/wiki/Overton_window) – the range of ideas a particular group of people will accept. Ideas range in degree of acceptance from policy, to popular, sensible, acceptable, radical, and unthinkable.**Corollary:** you need to be sensitive to the overton window when presenting the group with cultural changes.
- [Political capital](https://en.wikipedia.org/wiki/Political_capital) – the trust and influence a leader wields with other people. Political capital increases when you make other people successful and decreases when you make unpopular decisions.**Corollary:** Spend political capital carefully.

**Product design**

- [Target market](http://www.defmacro.org/2016/11/23/talking-to-users.html) – a predicate that partitions new leads into opportunities and distractions. A good target market function is terse, has a discoverable domain, and has a well defined probability of close in a specific time bound.**Example:** Anyone who has a Cisco password has a 50% probability of close within 30 days.
- [Internal press release](https://www.quora.com/Amazon-company-What-is-Amazons-approach-to-product-development-and-product-management/answer/Ian-McAllister?srid=3TH) – you  developing a product by writing an internal press release , explaining to target customers why the product is useful and how it blows away the competition. You then test it against potential users (it’s much easier to iterate on the press release than the product).**Corollary:** If the press release is hard to write, then the product is probably going to suck.

    start

    first

- [Quantum of utility](https://news.ycombinator.com/item?id=542768) – a rule of thumb for launching the product. A product possesses a quantum of utility when there is at least some set of users who would be excited to hear about it, because they can now do something they couldn’t do before.**Note:** “Launch” can be defined as a private beta, or even giving the product to a friend. The point is to get it into the hands of  who’s not in the building as soon as possible.

    someone

- [Worse is better](http://dreamsongs.com/RiseOfWorseIsBetter.html) – a design philosophy which states that solving the customer’s problem and leaving unpolished rough edges empirically outperforms “beautiful” products.**Example:** Lisp Machines vs C/Unix.**See also:** [Worse is worse](http://www.artima.com/weblogs/viewpost.jsp?thread=24807).
- [Kano model](https://en.wikipedia.org/wiki/Kano_model) – a model for categorizing possible features to optimize resource allocation. Essentially partitions the product into gamechangers, showstoppers, and distractions.**See also:** [How to build great products](http://www.defmacro.org/2013/09/26/products.html).

**Business**

- [Five forces](https://en.wikipedia.org/wiki/Porter's_five_forces_analysis) – a model for analyzing the competitive intensity and therefore attractiveness of an industry. The five forces are: threat of new entrants, threat of substitutes, bargaining power of buyers, bargaining power of suppliers, and industry rivalry.**Note:** this is essentially a  estimation model for companies in an industry.

    base rate

- [Power of defaults](https://en.wikipedia.org/wiki/Familiarity_heuristic) – the observation that people favor the familiar over novel places, people, things, and processes. **Corollary:** Overcoming the familiarity heuristic at scale requires enormous [activation energy](https://en.wikipedia.org/wiki/Activation_energy)unavailable to startups.**Corollary:** It is dramatically easier to capture mindshare before people’s minds are made up, than to change their mind later.**See also:** [Default effect](https://en.wikipedia.org/wiki/Default_effect_(psychology)), [path of least resistance](https://en.wikipedia.org/wiki/Path_of_least_resistance), [brand equity](https://en.wikipedia.org/wiki/Brand_equity).
- [Economies of scale](https://en.wikipedia.org/wiki/Economies_of_scale) – the advantages due to size or scale of operation, where cost per unit decreases with increasing scale.**See also:** [Network effects](https://en.wikipedia.org/wiki/Network_effect), [brand equity](https://en.wikipedia.org/wiki/Brand_equity), [first mover advantage](https://en.wikipedia.org/wiki/First-mover_advantage).
- [Price/performance curve](https://en.wikipedia.org/wiki/Price%E2%80%93performance_ratio) – the observation that the price of important technology drops and performance improves over time.**Example:** [Moore’s Law](https://en.wikipedia.org/wiki/Moore%27s_law).