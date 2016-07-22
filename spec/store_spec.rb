require('spec_helper')

describe(Store) do
  it("is sold at many stores") do
    test_store = Store.create({name: "Bucky's Shoes"})
    brand1 = Brand.create({name: "Smerv"})
    brand2 = Brand.create({name: "Shpersh"})
    test_store.brands.push(brand1, brand2)
    expect(test_store.brands()).to(eq([brand1, brand2]))
  end

  it("ensures the name is at least one character") do
    store = Store.new({name: ''})
    expect(store.save()).to(eq(false))
  end

  describe('#capitalize_name') do
    it('capitalizes the name of a brand') do
      store = Store.create({name: 'buckys'})
      expect(store.name()).to(eq('Buckys'))
    end
  end
end
