# Rails Job Portal

## About the Project

- This project is about a Job portal.
- Where users can login and view about the jobs
- Only users can view or apply for the job when signed in or signed up
- And user can apply for the job

##### You can checkout the project in https://job-apply-portal.herokuapp.com/


#### For using the project in your local drive follow these steps

#### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby 3.0.0
- Rails 6.1.3.1


#### 1. Check out the repository

```
git clone git@github.com:sridhar16899/job-portal.git
```

#### 2. Installing the Gems

Run the following command to install all the gemfile corresponding to the project

```ruby
bundle install
```

#### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

#### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

