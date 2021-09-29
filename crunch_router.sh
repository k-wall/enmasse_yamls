#!/usr/bin/env python



import fileinput
import re
import datetime

accepted = 0
abort = 0
authfail = 0
closed = 0
opened = 0
heading =0 
start = datetime.datetime.min

def roundTime(dt=None, roundTo=60):
   """Round a datetime object to any time lapse in seconds
   dt : datetime.datetime object, default now.
   roundTo : Closest number of seconds to round to, default 1 minute.
   Author: Thierry Husson 2012 - Use it as you want but don't blame me.
   """
   if dt == None : dt = datetime.datetime.now()
   seconds = (dt.replace(tzinfo=None) - dt.min).seconds
   rounding = (seconds+roundTo/2) // roundTo * roundTo
   return dt + datetime.timedelta(0,rounding-seconds,-dt.microsecond)


for line in fileinput.input():
    split = line.split()
    time = datetime.datetime.strptime("%s %s" % (split[0], split[1]), "%Y-%m-%d %H:%M:%S.%f")
    if time > (start + datetime.timedelta(seconds=60)):
        if heading % 25 == 0 :
            print("{}, {}, {}, {}, {}, {}".format(time, "Accepted", "Opened", "Closed", "Abort", "Authfail"))
        print("{}, {}, {}, {}, {}, {}".format(time, accepted, opened, closed, abort, authfail))
        accepted = 0
        authfail = 0
        closed = 0
        opened = 0
        abort = 0
        heading = heading +1
        start = time

    if re.compile(".*Accepted.*").match(line):
        accepted = accepted + 1
    if re.compile(".*Connection Closed.*").match(line):
        closed = closed + 1
    if re.compile(".*Connection Opened.*").match(line):
        opened= opened+ 1
    if re.compile(".*aborted.*").match(line):
        abort = abort + 1
    if re.compile(".*Failed to authenticate client.*").match(line):
        authfail = authfail + 1
   


#datetime.datetime.strptime(string_date, "%Y-%m-%d %H:%M:%S.%f")


#2020-05-01 07:25:14.469597 +0000

#echo "2020-05-01 07:25:14.469597 +0000" | awk '{print mktime($1 $2)}'
