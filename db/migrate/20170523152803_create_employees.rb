class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :annual_salary, null: false
      t.decimal :super_rate, :precision => 8, :scale => 2, default: 0
      t.string :pay_period, null: false
      t.integer :gross_income
      t.integer :income_tax
      t.integer :net_income
      t.integer :super_res

      t.timestamps null: false
    end
  end
end
