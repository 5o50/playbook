Sport HedgeFund — GRK BOSS

btctrader [5 hours ago]

you bounced? @grk xD

grk [5 hours ago]

my life turned into a bear market thank you mark karples :stuck_out_tongue:

Kam Kardootsian [5 hours ago]

When the price don't bounce the traders do

grk [5 hours ago]

^

grk [5 hours ago]

plenty of other markets out there

grk [5 hours ago]

algorithmic sports trading is a great one :wink:

grk [5 hours ago]

exotic art options

grk [5 hours ago]

random length lumber futures

bugmenot [5 hours ago]

if bitcoin dies i gonna get myself another hobby

Kam Kardootsian [5 hours ago]

Dude I have been looking into that shit stats tracking and stuff

grk [5 hours ago]

haha

grk [5 hours ago]

i built a hedgefund around it for tennis

grk [5 hours ago]

shit is fun as hell to do

Kam Kardootsian [5 hours ago]

Wow nice haha a tennis hedge fund

ghost_of_tj_x [5 hours ago]

are you kidding me lol

grk [5 hours ago]

nope

grk [5 hours ago]

if you can get the data, which is accessible from places like optisports or whatever the data provider is called, you can get historical tennis match data going back to like before the 2000s

grk [5 hours ago]

i would get upcoming matches/players loaded 3-4x daily to my db

grk [5 hours ago]

and historically id have every single match played and about 20-30 columns of match stats, like p1_unforced_errors, p1_avg_serve_speed, etc

grk [5 hours ago]

i started simple with a logistic model to predict probabilities of which player would win the match based on historical performance

grk [5 hours ago]

exponential time scaling on matches, so matches played earlier -> higher weight in the model

grk [5 hours ago]

surface model, covariance matrix, grass/clay/hard, used to weight the matches as they went into the model

grk [5 hours ago]

e.g. a match played 2 years ago on clay would have a time and surface weighting based on the UPCOMING match -> so if its played on grass then you look up the ratio between grass/clay (0.35 or whatever)

grk [5 hours ago]

and you go through and do this for each match...

Kam Kardootsian [5 hours ago]

Haha good shit

grk [5 hours ago]

and then there is a LOT of feature engineering to use the raw data and combine in it various ways to come up with new measures, like "serve advantage" or whatever, to capture the underlying player characteristic you want to model..

grk [5 hours ago]

and then you backtest it

grk [5 hours ago]

then you build a cost allocation model, e.g. determine how much money to put in

grk [5 hours ago]

HOW DO YOU MAKE MONEY!!

grk [5 hours ago]

well

grk [5 hours ago]

first you go look at the bookies predictions and their odds, if a bookie has player 1 at 1.5

grk [5 hours ago]

but you predict player has a 1.4 chance

grk [5 hours ago]

you make money on that diff

grk [5 hours ago]

you are trying to predict outcomes better than bookies

grk [5 hours ago]

SO YOU MADE MONEY OH SHIT

grk [5 hours ago]

what next?

grk [5 hours ago]

you get fucking banned from the bookies no joke

smassive [5 hours ago]

@grk you're talking to yourself

grk [5 hours ago]

they're a private business, they get rid of winners

smassive [5 hours ago]

I'm kidding, we all love you

grk [5 hours ago]

then you go to a trading exchange, such as betfair

drummerboye [5 hours ago]

yeah you got banned?

grk [5 hours ago]

now you can bet against other people, like a regular exchange

grk [5 hours ago]

tada!

grk [5 hours ago]

hedgefund

grk [5 hours ago]

thats the simplified example

grk [5 hours ago]

the model became a monster after i spent 6 months or so on it

grk [5 hours ago]

but yea thats one of the examples of my algo background :thumbsup: and a good place to start @Kam Kardootsian if you ARE interested in taking it further/the playbook

smassive [5 hours ago]

Wow, you're legit a superstar. You get banned from gambling because you're too good. We're lucky your share your thoughts with us

rocketman [5 hours ago]

how do you make money off the probability difference? going by the law of averages? or arbitraging against the bookies?

grk [5 hours ago]

no you dont arb the bookies, on the long term, since you are better at predicting the TRUE probability of a player winning what you do is scale your entry based on the spread

grk [5 hours ago]

so if the bookie things player 1 has 60% chance but you KNOW that he really has a 40% chance

grk [5 hours ago]

you know what to do :slightly_smiling_face:

grk [5 hours ago]

over the long term you make a LOOOOOOOT of bets, i think we were doing about 20-30 daily at the start

grk [5 hours ago]

you dont make money off nadal or the famous players, too many actual traders know how to trade superstar players

grk [5 hours ago]

you make your money trading off the players ranked 1000-200~

drummerboye [5 hours ago]

dude that is nuts. very well planned

rocketman [5 hours ago]

where good algos outpredict the human bookies

grk [5 hours ago]

thats where algorithmic trading shines, where humans cant know everything about player rank 991 vs player rank 521

grk [5 hours ago]

but the model can easily predict it

rocketman [5 hours ago]

what did you study in college grk? (not that really "matters" but is your background mostly math?)

grk [5 hours ago]

math, pure + applied and comp sci as well

grk [5 hours ago]

i never really went to class though and hated uni

grk [5 hours ago]

i spent most of my time starting businesses, got into seo around 2007, had a few startups, etc

grk [5 hours ago]

trading was the way i funded my activities