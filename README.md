# KidReads
### A place to discover, discuss, and share children's books.

App Academy Student Final Project by Julie Kang.   
Single-Page book sharing app inspired by GoodReads.   
Backbone.js on Rails, styled with Twitter Bootstrap using the Amelia template from Bootswatch.    
Developed in 7 Days.   
http://www.kidreads.org/ for a demo.   

### Screenshots

Splash Page:   
<img width="500" src="http://imgur.com/G3rOr7j">

Activity Stream showing events by your children, parents, and members of clubs you are in:   
<img width="500" src="http://imgur.com/fGB9qfS">

Book Detail Page:   
<img width="500" src="http://imgur.com/YxolVC4">

Parents can create clubs and add their children:   
<img width="500" src="http://imgur.com/kdMeZYw">

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
