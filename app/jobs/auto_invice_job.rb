class MyJob
    include Sidekiq::Worker
  
    def perform(user)
      # Code to perform the job
    end
  end