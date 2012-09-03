@path = "/usr/local/www/usesthis.com"

listen 3000

worker_processes 3
working_directory @path

timeout 30

listen "#{@path}/tmp/unicorn.sock"
pid "#{@path}/tmp/unicorn.pid"

stdout_path "#{@path}/log/unicorn.access.log"
stderr_path "#{@path}/log/unicorn.error.log"
