FOR MEAL PLAN GENERATOR

Count how many meals need to be selected
Pick percentage of NEW meals (20%?) from total, place randomly in plan
  Do this after to prevent tricky loading of remainer?
    Possibly generate whole plan, then replace 20% of meals with new
  How to choose which (b/l/d) meal?
Through scoping, organize meal database bases on ratings for chosen category
Select from top tier (star count) until it's gone, then move down

^^Where to insert bulk meal logic?

Make load animation on oven due to long ajax calls?
Replace database.yml timeout cheat with some implimentation of $.when() ajax?
Make const variables in global scope of static page elements to dry up SELECTORS
Narrow routes to eliminate unnecessary code
There's gotta be some way to DRY up getters/model relationships
Need start date for week plans so there's not a ton of overlapping nonsense

FINAL TASKS

Seed db. I'm thinking at least 10 of each w/ extra lu/di

Tweak oven button to
  change text back to create your plan when discarding plan
  delete the whole plan in controller when discarding

Correct ingredient string helper to reformat instances w/o amounts

Fix issue with generator
  consistently not making first day and
  offsetting each day by one
  **Only generate the days you need?? Might help**
  need scopes to only grab the proper meals when compiling

Delete unnecessary code, including
  controller actions
  whole controllers
  routes
  db stuff (bulk)
