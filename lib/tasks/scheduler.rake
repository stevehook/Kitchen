desc "This task is called by the Heroku cron add-on"
namespace :zanzaneet do
  task :alive do
     uri = URI.parse('http://www.zanzaneet.com/')
     Net::HTTP.get(uri)
  end
end
