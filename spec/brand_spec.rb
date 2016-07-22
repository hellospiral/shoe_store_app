require('spec_helper')

describe(Brand) do
  it("is sold at many stores") do
    brand = Brand.create({name: 'Smerv'})
    store1 = Store.create({name: "Bucky's Shoes"})
    store2 = Store.create({name: "Mike's Shoes"})
    brand.stores.push(store1, store2)
    expect(brand.stores()).to(eq([store1, store2]))
  end
end
