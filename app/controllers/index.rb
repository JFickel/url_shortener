get '/' do
  @urls = Url.all
  erb :index
end

post '/urls' do
  url = Url.new(params[:url])
  url.short_url = SecureRandom.urlsafe_base64(6)
  if url.save
    redirect '/'
  else
    erb :fail
  end
end

# e.g., /q6bda
get '/:short_url' do
  @url = Url.where(short_url: params[:short_url]).first
  redirect "http://#{@url.long_url}"
end 
