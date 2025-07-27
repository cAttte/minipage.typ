#import "minipage.typ": minipage

would ya look at that

#stack(dir: ltr,
    minipage(```
        hello i am in a minipage i can't believe this
    ```, width: 50%),
    minipage(```
        #set text(fill: white)
        #rect(fill: red)[me too bro]
    ```, width: 50%)
)
