︠c6341cab-327a-4e66-bb9f-a26b8ee06a38︠
email('wstein@gmail.com', 'hi', 'the message', 'wstein@uw.edu')
︡ccd446dc-c9d8-4e21-88f1-e2bef0937c6f︡{"stdout":"Child process 1413 is sending email to wstein@gmail.com...\n"}︡{"stdout":"Successfully sent an email to wstein@gmail.com."}︡
︠f44b28d3-7c47-4f9a-85d9-f9bc96ace53d︠
import csv
cols = None
data = []
with open('%s/restricted/grades-480 - Sheet 1.csv'%os.environ['HOME'], 'rb') as csvfile:
     reader = csv.reader(csvfile)
     for row in reader:
        if cols is None:
            cols = row
        else:
            data.append(dict(zip(cols, row)))
︡d96bd367-a00a-4ebc-b952-1279cd28ebf4︡{"stderr":"Error in lines 4-10\nTraceback (most recent call last):\n  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nIOError: [Errno 2] No such file or directory: '/mnt/home/D6VXKxGo/restricted/grades-480 - Sheet 1.csv'\n"}︡
︠d7ff65ad-eb26-4fb9-990f-636e4a0e3398︠
cols
︡10cfc452-d0fa-410a-a300-71ae4703824e︡{"stdout":"['', 'Name', 'Class', 'Major', 'Email', 'HW1', 'HW2', 'hw2 comment', 'HW3', 'HW3 comment', 'HW4', 'HW5']\n"}︡
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

I haven't finished grading homeworks 4 and 5 yet.

I will drop your *two* lowest homework grades when computing your final course grad.

 -- William (wstein@uw.edu)
 """%(name, d['HW1'], d['HW2'], d['hw2 comment'], d['HW3'], d['HW3 comment'])
    print name
    sys.stdout.flush()
    email(d['Email'], 'Math 480 grades', s, 'wstein@uw.edu')

︠333220fb-fe3f-46b0-9c03-b56c3ea8fa7e︠


