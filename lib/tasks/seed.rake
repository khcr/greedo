namespace :seed do 

  desc "Setup the environment"
  task :all => [:user]

  desc "Create an admin user"
  task user: :environment do
    User.create(name: "Admin", password: "12341", password_confirmation: "12341", level: 1)
    if User.find_by_name('Admin').nil?
      User.create(name: "Admin", password: "12341", password_confirmation: "12341", level: 1)
    end
  end

end