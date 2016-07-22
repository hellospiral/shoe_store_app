require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  erb(:index)
end

post('/stores') do
  name = params['name']
  address = params['address']
  phone = params['phone']
  @store = Store.create({name: name, address: address, phone: phone})
  redirect to('/')
end

get('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  erb(:store)
end

get('/stores/:id/edit') do
  @store = Store.find(params['id'].to_i)
  erb(:store_edit)
end

patch('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  name = params['name']
  address = params['address']
  phone = params['phone']
  @store.update({name: name, address: address, phone: phone})
  redirect('/stores/' + @store.id.to_s)
end
