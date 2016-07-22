require('spec_helper')

describe('the root path', {:type => :feature}) do
  it('renders stores and the new store form on the index page') do
    store = Store.create(name: "Bob's shoes")
    visit('/')
    expect(page).to have_content("Bob's shoes")
  end

  it('creates a new store through the form on the index page') do
    visit('/')
    fill_in('name', with: "Bob's shoes")
    click_button('Add Store')
    expect(page).to have_content("Bob's shoes")
  end
end

describe('the store path', {:type => :feature}) do
  it('renders store name, address, and phone number on store page') do
    store = Store.create(name: "Bob's shoes", address: '1234 Main', phone: '555-555-5555')
    visit('/stores/' + store.id.to_s)
    expect(page).to have_content("Bob's shoes")
    expect(page).to have_content('1234 Main')
    expect(page).to have_content('555-555-5555')
  end

  it('updates the information for a store') do
    store = Store.create(name: "Bob's shoes", address: '1234 Main', phone: '555-555-5555')
    visit('/stores/' + store.id.to_s)
    click_link('Edit Store')
    fill_in('Address:', with: '4321 Main St')
    click_button('Update Store')
    expect(page).to have_content('4321 Main St')
  end

  it('deletes a store') do
    store = Store.create(name: "Bob's shoes")
    visit('/stores/' + store.id.to_s)
    click_button('Delete Store')
    expect(page).to have_no_content("Bob's shoes")
  end
end

describe('the brand path', {:type => :feature}) do
  it('creates a new brand through a form on the index page') do
    visit('/')
    fill_in('brand_name', with: "Nike")
    click_button('Add Brand')
    expect(page).to have_content("Nike")
  end
end
