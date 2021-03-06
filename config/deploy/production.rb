role :app, %w{pi@192.168.178.58}
role :web, %w{pi@192.168.178.58}
role :db,  %w{pi@192.168.178.58}

# Define server(s)
server '192.168.178.58', user: 'pi', roles: %w{web app db}, primary: true

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
    forward_agent: true,
    user: 'pi',
    port: 22,
    password: "raspberry"
}
