# Enoch Calendar

This project is an attempt to calculate a timeline and conversion between Gregorian dates and the Enoch Calendar.

## Description of the Enoch calendar

The Enoch calendar divides the year into four seasons of exactly 13 weeks each.
Each such season consists of two 30-day months followed by one 31-day month,
with the 31st day ending the season, so that Enoch's year consists of exactly
364 days.

The Enoch calendar has the following properties:

1. Each year starts on a Sunday and the days of the week continue unbroken (Sunday - Saturday).
2. The year has exactly 364 days with 12 months of each 30 days, but four of them have 31 days (months 3, 6, 9 and 12), for a total of 91 days per quarter-of-year (season).
3. Every seventh year an extra week is added to the year (called a saturday year with a "jubilee" week). This extra week is added at the end of the last month (month 12).
4. Every fourth saturday year has two extra weeks instead of one (a double jubilee).
5. Every 364 years is called a "Great Year" (GY) consisting of 12 "Great Months" (GM) each with 30 years. There is an extra "31st Great Day" on four of the great months (GM3, GM6, GM9, GM12). This pattern is symmetrical with the 364-day year.
6. Every third Great Year and every fifth Great Year one week is removed from one double jubilee saturday year, so the double jubilee for that year becomes a regular jubilee. Alter the first double jubilee of each of the fore-mentioned Great Years, so the 28th year.

Rules 3-6 are suggested by John Pratt to ensure long-term accuracy since
only 364 days in the year the calendar would get out of sync with the seasons.
See [Mapping time](https://www.johnpratt.com/items/docs/mapping_time.html#6).

See also:
https://www.johnpratt.com/items/docs/lds/meridian/2001/enoch_cal.html

## Requirements/installation

This program requires php 7+

After cloning this repository, run `make` to generate the days "databases."

```
$ make
Generating dates for all days from -4004 to 3276
ENOCH_DAILY=1 php enoch-cal > enoch-all.txt
Generating dates for anno domini from 0000 to 3276
ENOCH_DAILY=1 ENOCH_DAYS=1196531 ENOCH_EPOCH=0000-03-26 php enoch-cal > enoch-ad.txt
Generating dates for uniform enoch calendar (no jubilees) for all days
ENOCH_DAILY=1 ENOCH_UNIFORM=1 ENOCH_EPOCH=-4021-02-04 php enoch-cal > enoch-uniform.txt
Generating dates for new years only
ENOCH_DAILY=0 php enoch-cal > enoch-ny.txt
```

Then run `enoch` one time to generate the cache file to make lookups faster. It
will take several minutes to create the cache file.

```
$ enoch
Creating cache file. This will take a while.
█████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ (12%)
```

## Usage

Review the output files to find specific dates.

Run `enoch` from command line with no arguments to output the current date.

```
$ enoch
Enoch date for 2020-02-19: Wed e~2064-11-30
```

Run `enoch <date>` with format YYYY-MM-DD of a Gregorian date to output the corresponding
Enoch calendar date for that date.

```
$ enoch 1976-07-04
Enoch date for 1976-07-04: Sun e~5981-04-15
```

## Database files

The following files are generated as artifacts from the make file:

 - `enoch-all.txt` - all the days from -4004 (B.C.) to 3276
 - `enoch-ad.txt` - days from year zero 0000 to 3276
 - `enoch-ny.txt` - just the enoch new years days
 - `enoch-uniform.txt` - all the days for the uniform enoch calendar (no jubilees)

Each generated line of the files looks like the following. Below is an example
line with an explanation of what each column means. Note: each value is delimited
by a tab character `\t`.

```
2458899 2200181 Wed g~ 2020-02-19   e~6024-11-30    GY17    GM07    GD18
^       ^       ^   ^               ^               ^       ^       ^
|       |       |   |               |               |       |       |
|       |       |   |               |               |       |       +-- The great day number starting with "GD"
|       |       |   |               |               |       |
|       |       |   |               |               |       +-- The great month number starting with "GM"
|       |       |   |               |               |
|       |       |   |               |               +-- The great year number starting with "GY"
|       |       |   |               |
|       |       |   |               +-- The Enoch date in format "e~" then YYYY-MM-DD
|       |       |   |
|       |       |   +-- The Gregorian date in format "g~" then (-)YYYY-MM-DD
|       |       |
|       |       +-- The day of the week
|       |
|       +-- The number of days calculated from the beginning of the file
|
+-- The julian date
```

## Enoch's Ten Weeks of the earth

According to the article [Enoch's Ten Week Prophecy](https://www.johnpratt.com/items/docs/2015/ten_week_prophecy.html) by
John Pratt, the author lays out a number of interesting facts about the history
of the earth being divided into ten "weeks" where each week is a period of 728
years (or two Great Years). In this article is given a start date of the Enoch
calendar: the spring of year -4004 (4005 BC).

According to these weeks, each "day" would be 104 days.

Key dates in ten week prophecy

```
Day 1      Sat -4004-03-31 e0001-01-01 GY1 GM1 GD1
Day 132952 Sun -3640-04-03 e0365-01-01 GY2 GM1 GD1
Day 265903 Sun -3276-04-06 e0729-01-01 GY3 GM1 GD1
Day 398847 Sun -2912-04-01 e1093-01-01 GY4 GM1 GD1
Day 531798 Sun -2548-04-04 e1457-01-01 GY5 GM1 GD1
Day 664742 Sun -2184-03-31 e1821-01-01 GY6 GM1 GD1
Day 797686 Sun -1820-03-26 e2185-01-01 GY7 GM1 GD1
Day 930637 Sun -1456-03-29 e2549-01-01 GY8 GM1 GD1
Day 1063588 Sun -1092-04-01 e2913-01-01 GY9 GM1 GD1
Day 1196532 Sun -0728-03-27 e3277-01-01 GY10 GM1 GD1
Day 1329476 Sun -0364-03-23 e3641-01-01 GY11 GM1 GD1
Day 1462427 Sun 0000-03-26 e4005-01-01 GY12 GM1 GD1
Day 1595371 Sun 0364-03-22 e4369-01-01 GY13 GM1 GD1
Day 1728322 Sun 0728-03-25 e4733-01-01 GY14 GM1 GD1
Day 1861273 Sun 1092-03-27 e5097-01-01 GY15 GM1 GD1
Day 1994217 Sun 1456-03-23 e5461-01-01 GY16 GM1 GD1
Day 2127168 Sun 1820-03-26 e5825-01-01 GY17 GM1 GD1
Day 2260119 Sun 2184-03-28 e6189-01-01 GY18 GM1 GD1
Day 2393063 Sun 2548-03-24 e6553-01-01 GY19 GM1 GD1
Day 2526014 Sun 2912-03-27 e6917-01-01 GY20 GM1 GD1
Day 2658958 Sun 3276-03-22 e7281-01-01 GY21 GM1 GD1
Day 2791902 Sun 3640-03-18 e7645-01-01 GY22 GM1 GD1
```

Other key dates

```
Birth of Christ ~ Aligns with passover (15 Nisan)
Day 1462437 Wed  0000-04-05 e4005-01-11 GY12 GM01 GD01

Baptism of Christ ~ Aligns with Atonement feast (10 Tishri)
Day 1473213 Sat  0029-10-06 e4034-07-21 GY12 GM01 GD30

Public ministry ~ Aligns with passover (15 Nisan)
Day 1473395 Sat  0030-04-06 e4035-01-21 GY12 GM02 GD01

Death of Christ ~ Aligns with Lamb sacrificed (14 Nisan)
Day 1474486 Fri  0033-04-01 e4038-01-20 GY12 GM02 GD04

Resurrection ~ Aligns with Sheaf offering
Day 1474488 Sun  0033-04-03 e4038-01-22 GY12 GM02 GD04

Day of Pentecost
Day 1474537 Sun  0033-05-22 e4038-03-11 GY12 GM02 GD04

Kirtland temple dedication
Day 2133013 Sun  1836-03-27 e5841-01-08 GY17 GM01 GD17
```
