class AddInitialTables < ActiveRecord::Migration
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:address, :string)
      t.column(:phone, :string)
    end

    create_table(:brands) do |t|
      t.column(:name, :string)
    end
  end
end
