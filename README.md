# KidReads
### A place to discover, discuss, and share children's books.

App Academy Student Final Project by Julie Kang.   
Single-Page book sharing app inspired by GoodReads.   
Backbone.js on Rails.    
Developed in 7 Days.   
http://www.kidreads.org/ for a demo.   

### Screenshots

Splash Page:
<img width="600" src="https://www.dropbox.com/s/8kjjgkv6xf0j3pv/Screenshot%202014-01-23%2020.18.35.png">

Activity Stream showing events by your children, parents, and members of clubs you are in:
<img width="600" src="https://www.dropbox.com/s/922ix7z06ylof1i/Screenshot%202014-01-23%2020.21.31.png">

Book Detail Page:
<img width="600" src="https://www.dropbox.com/s/xtkivsbqs4c1sp1/Screenshot%202014-01-23%2020.29.07.png">

Parents can create clubs and add their children:
<img width="600" src="https://www.dropbox.com/s/c8j14ujeu1v04f9/Screenshot%202014-01-23%2020.33.04.png">

###TODO:

+ Scheduled API calls to update the books table from GoodReads
+ Infinite scrolling of search results and activity stream
+ Pruning of activity stream: if someone rates over and over, just post once
+ Set things up so that only parents can sign up, then sign their own kids up
    + Parents can then add their own kids to clubs they've created
    + Club leaders can then add other parents to join their clubs, who can then add their own kids.
+ Update user accounts
+ Implement the "D" of CRUD: delete reviews, ratings, user accounts
+ In-club discussion board with nested comments
+ Data mining
    + book recommendations
+ Display books in columns in user show page, maybe horizontal scrolling?
