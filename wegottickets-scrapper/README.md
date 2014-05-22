# WeGot Tickets Scrapper

Ruby web scrapper for wegottickets.com
The aim is to get concerts, but mainly avoids comedies as the information given on the website is a bit strange.

## How to run?

You will need ruby 2.1.0 to run this program.

```shell
$ bundle
$ ./scrapper.rb
```

## Output

The output is in JSON format, it goes until page number 20, but you can change it to go further.

It gives user information in what page is being processed.

```shell
"Processing outers... (1/20)"
...
"Processing outers... (20/20)"
```


```json
[
  { "name": "4 TOP STAND UPS",
    "href": "http://www.wegottickets.com/event/270080",
    "city": "LONDON: ",
    "venue": "Headliners Comedy Club @ George IV",
    "date":"Sat 10th May, 2014, 830pm"
  },
  { "name": "99 CLUB COVENT GARDEN - SAT 10TH MAY",
    "href": "http://www.wegottickets.com/f/7159",
    "city": "",
    "venue": "99 Club Covent Garden, 42 Earlham Street, London WC2H 9LA",
    "date": "Sat 10th May, 2014 Doors open: 7pm  Show Starts: 8pm  Show Ends: 10pm"
  }
]
```

## TODO

In future I could have a list of artists and fetch the ones that match.
For now I just want to fetch as many as possible, except comedies.
