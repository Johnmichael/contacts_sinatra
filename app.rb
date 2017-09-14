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

post('/:id') do
  @contact = Contact.search(params[:id])
  Contact.remove(@contact.id)
  redirect '/'
  erb(:contact_detail)
end

get('/address/:id') do
  @contact = Contact.search(params[:id])

  erb(:address)
end

post('/address/:id') do
  street = params['street']
  zipcode = params['zipcode']
  state = params['state']

  @contact = Contact.search(params[:id])

  Contact.address(@contact.id, street, zipcode, state)
  redirect '/'
  erb(:address)
end

get('/update/:id') do
  @contact = Contact.search(params[:id])
  erb(:update)
end

post('/update/:id') do
  @contact = Contact.search(params[:id])

  first_name = params["first_name"]
  last_name = params["last_name"]
  phone_number = params["phone_number"]
  email = params["email"]

  Contact.update(@contact.id, first_name, last_name, phone_number, email)
  redirect '/'
  erb(:update)
end
