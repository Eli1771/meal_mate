# README

WELCOME TO MEAL MATE

MealMate is a single page application to generate recipe-based meal plan for the coming week in just a few clicks. Runs with a Ruby on Rails based server on SQLite3 with a JS frontend

- Currently running Rails version 6.0.1

- Clone directory onto local machine. Install all dependancies in terminal with $ bundle install. Currently only configured for Chrome

- Construct database with $ rails db:migrate. Seed database with recipe libraries with $ rails db:seed

- Initialize server with $ rails s. Keep in mind that generated meal plans persist through multiple sessions

- Debug in-console by exiting the server with control-C and running $ rails c
  - TO MANUALLY DELETE ALL MEAL PLANS: In the opened Rails console run
    $ RecipePlan.clearAll
    $ DayPlan.clearAll
    $ WeekPlan.clearAll

    (The order matters)
