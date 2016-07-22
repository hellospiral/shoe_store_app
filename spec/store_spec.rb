require('spec_helper')

describe(Store) do
  it("is sold at many stores") do
    test_store = Store.create({name: "Bucky's Shoes"})
    brand1 = Brand.create({name: "Smerv"})
    brand2 = Brand.create({name: "Shpersh"})
    test_store.brands.push(brand1, brand2)
    expect(test_store.brands()).to(eq([brand1, brand2]))
  end
end
