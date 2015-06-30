# SuggestDjinn

https://suggest-djinn.herokuapp.com/

Users are prompted to enter things that they like and rate them on a scale of 1-5. Users can view a list of items that they
are most likely to like, based on the other items they have rated.

# Code

The SuggestDjinn app implements the Slope One algorithm. Whenever a user adds a new item preference, it updates the
ratings differential between the new item and all other items that the user has already rated (the `Item#cascade` method)

Whenever a user wishes to view their top suggestions, the algorithm calls the `User#suggest` method, which iterates over all
items the user hasn't ranked and compares them to how the user has rated each item that they have ranked. 


# Discussion of results

At first glance, the algorithm appears to give somewhat reasonable suggestions; however, it is hard to directly measure the 
success of the algorithm.

One problem currently faced by this app is the small amount of sample data I was able to acquire, as well as not having
any true system of data auditing. This leads to data that is fairly non-uniform, and user data which does not often intersect
with the data of other users. In the future it would be a good idea to improve this by implementing some sort of system
to prompt users to select and rate items that are currently in the database.

The lack of differentiation between various items by category could also be improved upon, to give smarter suggestions.

One final improvement could come from the implementation of the `User#inefficient_unrated_items` method, which, as the name suggests,
is suboptimal. Ideally, this would be implemented with as much SQL as possible, rather than filtering SQL results using
Ruby.

# TODO
future areas for improvement:

- UI Fixes, i.e. search suggest when rating things (twitter bloodhound)
- Implement some sort of system to prompt users to rate certain things