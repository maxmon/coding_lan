##startup 

- `rails new appName`
- `bundle install` install gems
- `rails server` start server

##request/response cycle

a controller, a route, and a view

- When you type http://localhost:8000/welcome, the browser makes a request for the URL /welcome.
- The request hits the Rails router.
- The router maps the URL to a controller action to handle the request.
- The controller action recieves the request, and asks the model to fetch data from the database.
- The model returns data to the controller action.
- The controller action passes the data on to the view.
- The view renders the page as HTML.
- The controller sends the HTML back to the browser.

###controller

`rails generate controller Pages` create file app/controllers/pages_controller.rb.

add function 

`class PagesController < ApplicationController 
  def home
  end
end`


###router

config/routes.rb `get 'welcome' => 'pages#home'`

 when a user visits *http://localhost:8000/welcome*, the route will tell Rails to send this request to the Pages controller's home action

###view

html app/views/pages/home.html.erb

css app/assets/stylesheets/pages.css.scss

	
	