require('spec_helper')

describe(Brand) do
  it("is sold at many stores") do
    brand = Brand.create({name: 'Smerv'})
    store1 = Store.create({name: "Bucky's Shoes"})
    store2 = Store.create({name: "Mike's Shoes"})
    brand.stores.push(store1, store2)
    expect(brand.stores()).to(eq([store1, store2]))
  end

  it("ensures the name is at least one character") do
    brand = Brand.new({name: ''})
    expect(brand.save()).to(eq(false))
  end

  describe('#capitalize_name') do
    it('capitalizes the name of a brand') do
      brand = Brand.create({name: 'smerv'})
      expect(brand.name()).to(eq('Smerv'))
    end
  end
end
