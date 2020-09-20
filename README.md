# IMGFishing
A short bash script and README for IMG fishing on youtube w/ firefox

2020.09.20
Created by Mr. Man Brother
Contact at mrmanbrother@gmail.com or MrManBrother at github for bugs

to use do

bash goFish.sh <inStartNumber-default=1> <inTotalNumber-default=5>

this will open firefox at the IMGXXXX where XXXX is the starting number (numbers with less than four digits will be pre-pended with zeroes) thru YYYY where YYYY is XXXX+total

i.e.

bash goFish.sh

will open a new firefox window, and IMG0001 thru IMG0005 in tabs

bash goFish.sh 520 10

will open a new firefox window, and IMG0520 thru IMG0529 in tabs
etc.

Opened tabs will be recorded in file \'searchHistory\'

You will get a warning if XXXX thru YYYY requested already appears in history

I highly recommend you pair this script with a procedure similar to that described here:

https://www.youtube.com/watch?time_continue=116&v=OewZNVBEqYs&feature=emb_title

to get rid of "related search" or "relevant for you" content that is not actually from the given phrase (and fuck off youtube for making this the default search behavior, idiots)

w/ ublock-origin, the phrases to block are:

www.youtube.com##ytd-shelf-renderer.style-scope:has(span:has-text(/Related to your search/i))

www.youtube.com##ytd-shelf-renderer.style-scope:has(span:has-text(/For you/i))

www.youtube.com##ytd-horizontal-card-list-renderer.ytd-item-section-renderer.style-scope:has(span:has-text(/Searches related to/i))

Good fishing!

