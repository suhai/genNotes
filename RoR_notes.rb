# http://guides.rubyonrails.org/

# THE APACHE SERVER
#https://coolestguidesontheplanet.com/get-apache-mysql-php-and-phpmyadmin-working-on-macos-sierra/
# To start Apache web sharing

# $ sudo apachectl start # then go to localhost to check it out

# to stop it, 
# $ sudo apachectl stop

# to restart it
# $ sudo apachectl restart

# To find the Apache version
# $ httpd -v

# You may also consider deploying your rails app with heroku
# If you do then you should have a username and password for heroku. You can find out more about heroku from the web.

# Look into Rails, Bootstrap, sass, javascript, html, sqlite3
# More features and security. Look into more gems about beefing up security 
# Look into all associations, belongs_to, etc 
# Look into AR methods, where, etc.  
# Look into validation 
# Look into Authentication
# checkout 'zeus' and 'spring' used to speed up rails application
# $ echo .zeus.sock >> .gitignore
# $ rake test
# $ time bundle exec rake db:migrate
#
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


# To get a schema / list of the associations included above the models, include
gem 'annotate' # in the gemfile, then inside the main directory of your project:
$ bundle install # to ensure gem 'annotate' is activated
$ bundle exec annotate # to get the schema listed at the top of the models

$ ruby -v # to check the ruby version being used
$ rails -v # to check the rails version being used
$ bundler -v # to check the bundler version being used
$ gem -v # to check the gem version being used

# BASIC WORKFLOW
# 1 use rails to create the basic skeleton of the application
# 2 create a database to hold your data
# 3 configure the application to know where your database is located and the login credentials for it if necessary
# 4 cretae rails Active Records (Models) because they are the business objects that you'll be working with in your controllers
# 5 generate migrations that make creatimg and maintaining database tables and columns easy
# 6 write cotroller code to put a life in your application
# 7 create views to present your data through User interface
#-------------------------------------------------------------------------------


# MAKING A NEW RAILS APP
# 1
$ rails new <name of app>
$ bundle install # inside the <name of app> folder may already have been done

# 2
# # You may need to reconfigure your database to use psql instead of sqlite if you want. To do that, go to /config/database.yml and do these:
# change 'default.adapter: from sqlite to postgresql'
# change 'development.database: from db/development.sqlite3 to <name of app>'
# You may also need to add 'username: postgres' and 'password: <password>' if you created one for postgresql inside development.username and development.password.
# You may copy and paste into 'test' and production if necessary.

# 3
# Next, go to the gemfile, comment out 'gem sqlite' and include 'gem pg'

# 4
$ bundle install inside the <name of app> folder to update the bundle

# 5
$ rails s # inside the <name of app> folder to start the webrick server. This will open it up on port 3000 by default. you can check it out by going to http://localhost:3000
# You may leave your server running and reopen a new terminal to do further work.

# 6
# Now you need to create a controller and a view. For example, if you are creating a HomePage, you may name your controller as 'home' and your corresponding view as 'index'.
$ rails g controller home index 
# For subsequent controllers that are not the homepage, you wanna pluralize the name of the controller, and the name of the view should be the same as that of its corresponding controller, for example to make a 'posts' controller you do:
$ rails g controller posts # or 'Posts' which will be the same anyway
# Note that controllers should always be plural and models should always be singular.
# There are about 7 actions or methods inside a controller: index is kinda like the root action because it is usually what displays the homepage. The 7 actions/methods are: index, new, create, edit, update, show, destroy. 
# Also note that for every controller there is usually a view
# So you should create a view post with and an index.html.erb file inside that folder. In order to use any of the 7 actions in the controller, we will need create a resource / route for the Posts controller. So go into the config/routes file and add 'resources :posts' after the 'get "home/index" line. You will almost always need to add every contoller as a resource in the routes file. Ex. 'resoruces :categories'
# You may need to restart your server for this changes to reflect.
# Next you will need to go create a model for posts in order to make all of that dynamic.
# $ rake routes # will list your currents routes 


# 7
$ rails g model <name of controller> capitalized first letter; singularized> title:string body:text
$ rails g model post title:string body:text category_id:integer author_id:integer # note that the category model may have to be created first.
$ rake db:migrate # to migrate / creates all the SQL stuff for you table

# To add a new column to a table at some later time after the table has alsready been sreated and migrated to the database, you do for example:
$ rails g migration add_cover_path_to_books coverpath:string
$ rake db:migrate
# tp add a 'coverpath' column to a 'books' table in the database.
# Don't for get to run rake db:migrate after that.

# For additional models, 
$ rails g model category name:string
$ rake db:migrate # to migrate / creates all the SQL stuff for you table

# 8
# Next, you cna move into your models and do the associations between the models: belongs_to :xyz, has_many :abcs, has_one :klm, has_many_through :qrs, has_one_through :mno, etc.

# 9
# To interact with the database, you do:
$ rails c # to get into rails console mode.

# 10
# For example, if you wanted to make a category for a 'News' section, you do:
$ news = Category.new(:name => "News") # but it isn't inserted into the db yet
$ news.save #this ensures that the above is actually inserted into the database.
# Alternatively, the above two lines would be done in one step like so:
$ tutorials = Category.create(:name => "Tutorials") # in one step

# To see a list of all your categories, you can run
$ Category.all # will display all categories and their details.
#-------------------------------------------------------------------------------



# RAILS
# Look into $ rails g scaffold <name>
# project 1
# browse books by category
# books will have authors and publishers
# Bootstrap layout
# books, categoris, authors, and publishers can be added from the front end

# To get a list of the associations above the models, include
gem 'annotate' # in the gemfile, then inside the main directory of your project:
# $ bundle install 
# $ bundle exec annotate


# STEPS
# 1
$ rails new <app_name> 

# 2
# go inside <name> directory
$ bundle install # you may need to do bundle update first
# go into gemfile inside <name> to add gems that you'd need / want 
# You could use:
gem 'bootstrap-sass', '~> 3.3.7'
gem 'autoprefixer-rails'
gem 'brycpt-ruby', :require => "bcrypt"
gem 'mail_form'
gem 'simple_form'
# re-run bunlde install
# if using simple form and bootstrap, also run:
$ rails generate simple_form:install --bootstrap

# 3
# Then start generating your controllers
$ rails g controller <name>s <action1> <action2> <action ...>
# ex. $ rails g controller posts new create edit update
# This should also generate / create views#action(s)
# if you get an error, you may need to install rubyracer or install nodejs

# 4 only if necessary
# To create an admin folder, make an admin directory inside the app folder. then
$ rails g controller admin/<name>s <action1> <action2> <action ...>

# Repeat #3 (and #4) for other needed controllers

# 5
# Next generate your models for each of the generated contollers by
$ rails g model <name> <field1:datatype> <field2:datatype> <field:datatype ...>
# ex. rails g model post title:string category_id:integer user_id:integer tags:text image:string body:text

# migrate the generated model to your database
$ rake db:migrate
$ rake db:rollback # to undo the last migration
$ rails g migration RemoveImageFromPosts image:string # to remove an 'image' column from a 'posts' table where the 'image' is the name of the field and 'string' is the type.
$ Post.column_names # to see the list of columns under 'Post'
$ rails g paperclip post image # to add an 'image' column to the 'post' table using paperclip. You will need to do $ rake db:migrate after that.
# Look into 'image magic' if you want to have the ability to resize images. might need to install other things on your server.
# Repeat 5 for each of your controllers

# If at any point you want to get into the rails console and check tings out, you can do '$ rails c' and you'll be able to do things like 
# category = Category.new(:name => "News")
# category.save
# or whatever you wish to check out.
# dont forget to exit your console with 'Ctrl C' when you want to get out of it.
# Do 'rails s' to get the server going, and then visit 'http://localhost:3000'

# 6
# Next, got to the rotes.rb file in conf folder to add your resources like:
resources :posts, :categories, :comments
resources "contacts", only: [:new, :create]

namespace :admin do 
  resources :posts, :categories, :comments, :users
end





# RAILS WITH POSGRESQL
$ rails new Dogs -d postgresql # creates a project with a postgresql database
# You may add gem 'pry-rails' to your gemfile to enable you use the rails console with pry if desired.
# Note that when you are in the rails console/pry you'll need to 'reload!' in pry anytime you update your model.
# You can use validations inside your models like:
class Cat < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  # validates :name, :color, presence: true, uniqueness: true
  validates :color, presence: true
  validates :some_method_you've_defined_inside_the_model'
  validates :no_green_cats # validates the no_green_cats method.
  def no_green_cats
    if self.color == 'green'
      self.errors[:color] << "can't be green"
    end
  end

  belongs_to :house,
    primary_key: :id, # note that this has to be equal to :house_id
    # primary_key points to the id in table of place (house) where cat belongs
    foreign_key: :house_id, # note that this has to be equal to :id
    # foreign_key points to the related id (foreign_key) of primary_key in other model, which in this case is the foreign_key in the Cat model
    class_name: :House

  has_many :toys,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Toy
end

pry => $ Cat.all.pluck(:name) # will give an array of all the cats
pry => jeff = Cat.new(:some_name_that_already_exists_in_the_cat_table)
pry => jeff.valid? # will throw false
pry => jeff.errors # returns a hash of causes for why it is not valid
pry => jeff.errors.full_messages # will return an array of strings 

# For example, there might be an inter-relationship between house, cats, and toys like below. the 
class House < ActiveRecord::Base
  has_many :cats,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Cat'
  # def cats
  #   Cat.where(house_id: self.id)
  # end

  has_many :toys,
    through: :cats, # name of association linking toys to house
    source: :toys # name of association within :cats where the link is completed
  # Note that the above code is equivalent to the below code
  # def toys
  #   toys = []
  #   self.cats.each do |cat|
  #     toys += cat.toys
  #   end
  #   toys
  # end
end

class Cat < ActiveRecord::Base
  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
  # The above code is equivalent to the below commented out code.
  # def house
  #   House.find(self.house_id)
  # end
  
  has_many :toys,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'Toy'
  # def toys
  #   Toy.where(cat_id: self.id)
  # end

  # And you can do a Benchmark to check the time differnce betwen start and end
  def self.how_long
    start = Time.now 
    Cat.where(name: 'Sarah').to_a
    (Time.now - start) * 1000 # to find time in milliseconds
  end

  # You can also look into 'indexing' to speed up your search for some columns. this reduces the serach time of the tree from linear to logarithmic. Ex, you can run a migration like so:
  # class AddIndexToCats < ActiveRecord::Migration
  #   def change
  #     add_index :cats, :name # adds an index to the name column.
  #   end
  # end
  # Note that the above is done in migration, not inside the model.
end

class Toy < ActiveRecord::Base
  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'Cat'

  has_one :house, # note that you don't use 'belongs_to'
    through: :cat,
    source: :house
end


# you may use a gem to to create fake names in your seeds.rb file like so:
1000.times do 
  Cat.create!(name: Faker::Name.first_name, color: :orange)
end





# Unconventional Associations
# 1. Reflexive Associations

# We've learned about the class_name/foreign_key/primary_key options for belongs_to and has_many. We know that Rails can often infer these. Let's see an example where it cannot:

class Employee < ActiveRecord::Base
  has_many :subordinates, 
           :class_name => "Employee",
           :foreign_key => :manager_id,
           :primary_key => :id
           
  belongs_to :manager, 
             :class_name => "Employee",
             :foreign_key => :manager_id,
             :primary_key => :id
end
# I call this a reflexive association, because the association refers back to the same table. Here, there is a employees.manager_id column that refers to employees.id column.
# We have to use the non-standard association names subordinates/manager because employees/employee would be extremely confusing to understand. Also, Rails itself will probably get confused if you have two associations on the same class that differ only in pluralization.
# Note that I also departed from the conventional employee_id column name. manager_id better explains the nature of this key.

# 2. Two associations to the same class
# Let's look at another example:
# # emails: id|from_email_address|to_email_address|text
# #  users: id|email_address

class User < ActiveRecord::Base
  has_many :sent_emails,
    :class_name => "Email",
    :foreign_key => :from_email_address,
    :primary_key => :email_address
  
  has_many :received_emails,
    :class_name => "Email",
    :foreign_key => :to_email_address,
    :primary_key => :email_address
end


class Email < ActiveRecord::Base
  belongs_to :sender,
    :class_name => "User",
    :foreign_key => :from_email_address,
    :primary_key => :email_address
  
  belongs_to :recipient,
    :class_name => "User",
    :foreign_key => :to_email_address,
    :primary_key => :email_address
end
# Here the Email and User objects are associated in two ways: sender and recipient. Additionally, the Email record doesn't reference User's id field directly; instead, it refers to an email_address. For that reason, we need to specify the primary_key option; this is otherwise by default simply id.

# Through these two examples, we've seen that we can go beyond the conventional ActiveRecord guesses in cases where our associations are a little special.


puts 'Rolling back migrations'
$ rake db:rollback # to rollback just one step
$ rake db:rollback STEP=n # to roll you back n migrations where n is the number of recent migrations you want to rollback.



puts 'TESTING'
# run $ rake test <file_path_of_the_test_file_to_test>
$ rake test test/controllers/home_controller_test.rb
# For example, the code above should test a home_controller_test.rb file located in the test folder. Note that some tests are automatically created for you when you generate controllers or models.

