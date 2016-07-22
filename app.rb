require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end

# CRUD for stores
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

delete('/stores/:id') do
  store = Store.find(params['id'].to_i)
  store.destroy()
  redirect('/')
end

post('/brands') do
  name = params['brand_name']
  @brand = Brand.create({name: name})
  redirect to('/')
end

# get('/brands/:id') do
#   @brand = Brand.find(params['id'].to_i)
#   erb(:brand)
# end
