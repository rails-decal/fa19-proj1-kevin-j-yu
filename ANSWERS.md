# Q0: Why are these two errors being thrown?
- For the first error, "Pending Migrations Exists" involves the schema table being created but has not been migrated. It can be solved by running `rails db:migrate` to run any migrations that haven't been run yet.
- The second error, `uninitialized constant HomeController::Pokemon` involves the fact that we have not created a model or controller for Pokemon. After generating both of these things, in Q1, this error is solved.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
In `seeds.rb`, we can see that other than initializing common trainers, we have the four Pokemon Squirtle, Charmander, Bulbasaur, and Pikachu, each with the correct Pokedex number, name, and level. What is shared is their level, which is randomized to a number between 1 and 20. 
```ruby
[['Squirtle', 7], ['Charmander', 4], ['Bulbasaur', 1], ['Pikachu', 25]].each do |name, ndex|
  Pokemon.create(
    name: name,
    level: rand(1..20),
    ndex: ndex,
  )
```

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
The statement `button_to` is forcing Rails to search for a PATCH method. In particular, to have Rails find the correct method, we use capture_path (Rails Magic here) to represent the path to start looking for a PATCH method, which in this case is just a method capture.

# Question 3: What would you name your own Pokemon?
DeNero

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
When running `rails routes`, I noticed that the `trainer#show` is referenced with a dynamic path `/trainers/:id(.:format)`. Therefore, I had
```ruby
redirect_to "/trainers/#{current_trainer.id}"
```
Using double quotes, I could format the string with the `id` of a trainer. It cannot be a static path as every trainer is unique with its own personal trainer profile page. Taking advantage of the question 1's Devise gem usage, I could reference the current trainer and gets its id.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.
This line is placed in the else case of checking if `@pokemon.save` was successful or not. At the end of `views/layouts/application.html.erb`, the following code:
```erb
<main role="main">
    <%= render 'layouts/messages' %>
    <%= yield %>
</main>
```
will render any necceasry messages by looping over the flash hash and display any messages contained within it.

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app
