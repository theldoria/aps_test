get '/hi' do
	"Hello World!"
end

get '/' do
	set :show_settings, true
	set :show_settings_environment, :production
	"Hey, this is from sinatra, go visit /hi\n" + show_settings_output?
end

