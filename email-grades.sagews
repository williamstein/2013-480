︠c6341cab-327a-4e66-bb9f-a26b8ee06a38︠
email('wstein@gmail.com', 'hi', 'the message', 'wstein@uw.edu')
︡e91a2613-372c-4fe8-80bc-afe4a670b74a︡{"stdout":"Child process 5958 is sending email to wstein@gmail.com...\n"}︡{"stdout":"Successfully sent an email to wstein@gmail.com."}︡
︠f44b28d3-7c47-4f9a-85d9-f9bc96ace53d︠
import csv
cols = None
data = []
with open('%s/restricted/480-grades/grade_sheet.csv'%os.environ['HOME'], 'rb') as csvfile:
     reader = csv.reader(csvfile)
     for row in reader:
        if cols is None:
            cols = row
        else:
            data.append(dict(zip(cols, row)))
︡44288138-156f-4a02-8281-4d2410d55327︡
︠a6c023d7-4c3d-437a-950b-af78443440f6︠

︠d7ff65ad-eb26-4fb9-990f-636e4a0e3398︠
cols
︡722aff99-6021-4326-b418-10a0a41af5ed︡{"stdout":"['', 'Name', 'Class', 'Major', 'Email', 'HW1', 'HW2', 'hw2 comment', 'HW3', 'HW3 comment', 'HW4', 'HW4 comment', 'HW5', 'HW5 comment']\n"}︡
︠104694fb-8d88-4628-846c-c2f915b2ecd6︠
for d in data:
    name = d['Name']
    name = ' '.join(reversed([x.strip() for x in name.split(',')]))
    s = """
Dear %s,

Your recorded grades so far in Math 480 are:

    - Homework 1 (code academy): %s (out of 1)

    - Homework 2 (implement something in python): %s (out of 1)

    - Comments on homework 2: "%s"

    - Homework 3 (make various things faster in cython): %s (out of 1)

    - Comments on homework 3: "%s"

    - Homework 4 (number theory): %s (out of 1)

    - Comments on homework 4: "%s"

I haven't finished grading homework 5 yet.

I will drop your *two* lowest homework grades when computing your final course grad.

 -- William (wstein@uw.edu)
 """%(name, d['HW1'], d['HW2'], d['hw2 comment'], d['HW3'], d['HW3 comment'], d['HW4'], d['HW4 comment'])
    print name
    sys.stdout.flush()
    email(d['Email'], 'Math 480 grades', s, 'wstein@uw.edu')
    #print s
    #sys.stdout.flush()
    #break

︠333220fb-fe3f-46b0-9c03-b56c3ea8fa7e︠


