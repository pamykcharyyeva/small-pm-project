
# Simple Project Management tool 

- Projects CRUD 
- Tasks CRUD 
- Tasks are nested within Project- nested_scaffold
- with login authentication - devise
- drag and drop - sortablejs


Gems that were used:

* gem 'devise' - for authenticasion 
https://github.com/heartcombo/devise
* gem 'nested_scaffold' - to create nested and make our life easier
https://github.com/henrydjacob/rails-nested-scaffold



Other :
* Bootstrap CDN - for css and design
https://www.bootstrapcdn.com/
* also some costume CSS as well
* Javascript library sortablejs- for sorting and drag and drop
https://github.com/SortableJS/Sortable
* fontawesome for grid and small icons
https://fontawesome.com/
* Stimulus Reflex - to add reactiveness to rails application, to simply and seamlessly update with little code
https://docs.stimulusreflex.com/


Cookie-based session storage is not currently supported by StimulusReflex. so I used Redis gems for that:
* gem 'redis', '~> 4.0'
* gem "hiredis", "~> 0.6.3"
* gem "redis-session-store", "~> 0.11.3"


# Link to Heroku app:
https://small-pm-app.herokuapp.com/