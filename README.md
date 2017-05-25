Employee monthly payslip

##environment

ruby 2.2.1p85
bundler version 1.10.6
sqlite3 1.3.13

##run application

- bundle install
- rake db:migrate
- rails s visit [http://localhost:3000/employees](http://localhost:3000/employees) test import ``spec/fixtures/files/test.csv`` data
- bundle exec rspec