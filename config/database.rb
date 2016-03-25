configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  dbfile = "db/#{settings.environment}.sqlite3"
  puts "connecting to database: #{dbfile}"
  set :database, {
    adapter: "sqlite3",
    #Allows the use of different databases depending on the rack environment.
    #So, when in testing on RSpec, it will use a test DB "test.sqlite3"
    #Normal app db will be "development.sqlite3"
    database: dbfile
  }

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
