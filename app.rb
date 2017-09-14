require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('pry')

get('/') do
  @list = Contact.all
  erb(:input)
end

post('/') do
  first_name = params["first_name"]
  last_name = params["last_name"]
  phone_number = params["phone_number"]
  email = params["email"]

  contact_hash = {"first_name" => first_name, "last_name" => last_name, "phone_number" => phone_number, "email" => email}


  contact = Contact.new(contact_hash)
  contact.save

  @list = Contact.all
  erb(:input)
end

get('/:id') do
  @contact = Contact.search(params[:id])
  erb(:contact_detail)
end
