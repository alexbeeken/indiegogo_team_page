desc "This task is called by the Heroku scheduler add-on"
task :update_campaigns => :environment do
  puts "Updating campaigns..."
  UpdateJob.perform_now
  puts "done."
end
