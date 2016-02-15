namespace :db do
  desc "Fill levels with three level data"
  task :populateUsers => :environment do
    Rake::Task['db:reset'].invoke
    first = "one"
    last = "one"
    email = "one@gmail.com"
    password = "one"
    User.create!(:first_name => first,
                    :last_name => last,
                    :email => email,
                    :password => password)
                    
    first = "two"
    last = "two"
    email = "two@gmail.com"
    password = "two"
    User.create!(:first_name => first,
                    :last_name => last,
                    :email => email,
                    :password => password)
                
    first = "three"
    last = "three"
    email = "three@gmail.com"
    password = "three"
    User.create!(:first_name => first,
                    :last_name => last,
                    :email => email,
                    :password => password)
                     
  end
end