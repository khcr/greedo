namespace :peerjs do
  desc "(Re)start PeerJS server"
  task :restart do
    on roles(:app) do
      within current_path do
        execute :forever, :stop, "server.js", raise_on_non_zero_exit: false
        execute :forever, :start, "server.js"
      end
    end
  end

  after "deploy:finished", "restart"
end
