# RSpec

# 1. make a directory that would contain a 'lib' drectory, a 'spec' directory, and the three files '.rspec', 'Gemfile', and 'Gemfile.lock'. 
# 2. cd into the created directory and make it into an rpsec directory with the command 'rspec --init'. This creates a '.rspec' file and a 'spec' folder which includes a 'spec_helper.rb' file within it. The 'spec_helper.rb' contains some useful information.
# 3. Include '--format documentation' inside the '.rspec' file. This would format the output of the test.
# 4. Exclude the '--require spec_helper' from the '.rspec' file. Otherwise there would be problems with running you test. This file is likely very useful, but I do not fully understand its function at this time.
# 5. Create a 'Gemfile' inside the rootDirectory with 'touch Gemfile' inside the terminal. Then put this text inside the Gemfile:
# source "https://rubygems.org"
# gem "byebug"
# gem "rspec", "~> 3.2.0"

# 6. Run 'gem install bundler' inside the rootDirectory from the terminal. This installs the Bundler gem.
# 7. Run 'bundle install' inside the rootDirectory from terminal. This would create the 'Gemfile.lock' file
# 8. cd into the lib directory and create your file(s) that would contain the code to be tested. Ex. hello.rb, fibonacci.rb
# 9. cd into the spec directory and create your spec or test file(s). These should ideally have take the name of their corresponding code files. Ex. hello_spec.rb, fibonacci_spec.rb.
# 10. After all the above is done and working, Run 'bundle exec rspec spec/fileName_spec.rb' to run a particular test file. Ex. bundle exec rspec spec/hello_spec.rb
# 11. Run 'bundle exec rspec' to run all available tests.