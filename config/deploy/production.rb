role :app, %w{pi@192.168.178.43}
role :web, %w{pi@192.168.178.43}
role :db,  %w{pi@192.168.178.43}

# Define server(s)
server '192.168.178.43', user: 'pi', roles: %w{web app db}, primary: true

ask(:password, nil, echo: false)

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
    forward_agent: true,
    user: 'pi',
    port: 22,
    password: fetch(:password)
}
