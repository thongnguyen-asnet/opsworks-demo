app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"

bash "run scraping" do
  code <<-EOH
    sudo npm install -g nightmare

    DATE=$(date +'%Y-%m-%d')

    cd #{app_path}
    cd indeed-scraping/backend/scripts/scraper/
    nohup xvfb-run -a --server-args="-screen 0 1024x768x24" node job-worker.js > /tmp/worker-$DATE.log &
    EOH
  not_if { ::File.exists?("/usr/bin/node") }
end
