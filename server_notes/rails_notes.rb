puts 'RUBY ON RAILS'
# Ruby on Rails is an open source web application development framework. A framework is a set of libraries and tools that can be used as a foundation for developing applications. Rails make the development of web applications simple. Rails applications operate upon a model-view-controller (MVC) architectural pattern. This means that they’re primarily split into three sections: models, views, and controllers. These components have the following roles:

# Models: These are used to represent forms of data used by the application and contain the logic to manipulate and retrieve that data. In Rails, a model is represented as a class. You can think of models as abstracted, idealized interfaces between controller code and data. These forms of data are not low-level things like strings or arrays, but domain-specific things like users, websites, videos, animals, or classrooms (which could be represented by classes named User, Website, Video, Animal, and Classroom respectively).

# Views: These are the templates (typically formed of a mixture of HTML and Ruby code) that are used to build up the data that users of the web application see in their brows- ers or through other clients. Views can be rendered as HTML for web browsers, XML, RSS, or other formats. While views can contain any combination of HTML and Ruby code, typically only the minimal Ruby code necessary to produce the view should be used, as the controller should be handling most of the logic.

# Controllers: Controllers provide the logic that binds together models (and their associted data) and views. They process input, call methods made available by models, and deliver data to the views. In Rails, controllers contain methods known as actions that, generally, represent each action relevant to that controller, such as “show,” “hide,” “view,” “delete,” and so forth.

# Users ---> Controllers ---> Models ---> Database ---> Models ---> Controllers ---> Views ---> Users
# The most common motivation to use Rails is that it removes a lot of the groundwork necessary to develop web applications using other technologies. Features such as database access, dynamic page elements (using Ajax—Asynchronous JavaScript and XML), templating, and data validation are either preconfigured or take only a few lines of code to configure.
# Rails also encourages good development practices. All Rails applications come with support for unit testing (among other forms of testing), and Rails’ guiding principles are “don’t repeat yourself” (known as DRY) and “convention over configuration.”

# When one installs rails, it comes with the following libraries, and more:   
# Rails: The core library of the Ruby on Rails framework that ties the other libraries together.
# ActionMailer: A library that makes it easy to send e-mail from Rails applications. A basic overview of ActionMailer, including how to use it to send mail separately from Rails, is given in Chapter 14.
# ActionPack: A library providing useful methods used in views and controllers to generate HTML and dynamic page elements, such as Ajax and JavaScript, or manage data objects.
# ActiveRecord: An object-relational mapper that ties database tables to classes. If you have an ActiveRecord object that references a row in a database table, you can work with that object as you would any other Ruby object (by using attributes and other methods), and changes will be stored in the relevant database table. A basic overview of ActiveRecord was given in Chapter 9.
# ActiveResource: Provides methods that make it easy to provide access to your applica- tion’s models remotely, as an API.
# ActiveSupport: A library that collects a number of support and utility classes used by various Rails features. For example, ActiveSupport implements many useful methods for manipulating times, numbers, arrays, and hashes.

# To start a new rails project, you just run the command:
# $ rails new <name_of_project> -d <database, ex mysql, postgresql, sqlite>

# rails generates the following main folders: 
# app: Contains most of the Ruby source code and output templates directly associated with the application. 

# app/controllers: Contains the controller files. In an empty project, only application_controller.rb exists. application_controller.rb is an application-wide controller where you can define methods that other controllers will inherit.
# app/helpers: Contains helper files — Ruby source code files that provide methods that you can use from views.
# app/models: Contains a file for each model in the application. In an empty project, no models are yet defined, so this directory is empty.
# app/views: Contains the output templates (views) for the application. Typically each controller has its own folder under app/views, with templates located in those fold- ers. There’s also a layout folder that Rails uses to store generic application-wide templates.
# config: An important folder that contains configuration files for the application. database.yml is a YAML file with information about the database(s) that the applica- tion will use. environment.rb and boot.rb are prebuilt files that you usually won’t need to edit, unless you want to tweak fine details of how your application is started. rutes.rb is mentioned later in this chapter in the section “Creating a New Action and View.”
# db: A folder to be used for database dumps, backups, and migrations.
# doc: Contains any RDoc documentation generated for the application. In an empty project, it contains a basic text file called README_FOR_APP, which you can use as a plain text documentation file, perhaps to contain instructions for others on how to install your app.
# lib: Contains third-party libraries and Rake tasks. You won’t need to use this directory at all for most Rails application development. Plugins have largely superseded the features offered by libraries that were once placed into lib.
# log: Contains log files relating to the operation of the application.
# public: Contains non-dynamic files that are accessible under your application’s URL scheme; for example, JavaScript libraries (in public/javascripts), images (in public/images), and CSS stylesheets (in public/stylesheets). This folder also includes several “dispatch” scripts and an .htaccess file that can be used in certain situations to run your application (such as when/if you choose to use CGI or FastCGI execution methods — neither of which are recommended).
# script: Contains scripts and command-line tools that are used in constructing and deploying Rails applications. console is an irb-like tool that preloads your Rails application’s environment before giving you a prompt. generate is a script that can generate certain types of Rails code for you from templates. server is used to run a basic HTTP server you can use to access your application from a web browser on your local network. The other scripts will not be of immediate use, and can be ignored.
# test: Contains the test subsystems for a Rails application. 
# tmp: Temporary storage area for data created and used by your Rails application (including cache and session files).
# vendor: Used for storing versions of the Rails framework that your application is bound to, as well as plugins (under the vendor/plugins directory)


# other definitions include:
# Actions: Methods contained within controllers that are accessed when requests for specific URLs are made upon the parent web application.
# CRUD (create, read, update, delete): The four basic actions you can perform upon discrete items and that are common to most web applications. In Rails 1.2 and later, these operations can correspond with the PUT, GET, POST, and DELETE HTTP verbs.
# ActiveRecord: A library that abstracts databases, rows, columns, and SQL into standard Ruby syntax using classes and objects. It’s a major part of the Ruby on Rails framework.
# Routing: The process of translating a URL into the desired controller and action by using routing patterns.
# Session: A process by which a unique ID is given to a new user of an application, and this unique ID is given back and forth on each further request, thereby making it possible to track that user.
# Plugins: Libraries for the Ruby on Rails framework that “plug in” to your applications. Plugins can override Rails’ default behaviors or extend the framework with new features you can easily use from your application, such as authentication systems. Plugins are installed on a per-application basis rather than for the Rails framework as a whole.
# Sinatra: A lightweight framework (or library) for developing web-facing applications in Ruby without significant amounts of ancillary code. A Sinatra app can be represented in just a few lines of code. 
# Ramaze: A lightweight web application framework that has more in common with Rails than Sinatra. It encourages you to develop web apps in the MVC style and includes a code generator that sets up a convenient structure for your code. Its official web site is at                   .