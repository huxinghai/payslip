require 'rails_helper'

RSpec.describe Employee, type: :model do

  context "validate attributes" do 
  end

  context "calculation rate" do
    before :each do 
      @employee = Employee.create(
        first_name: "David", 
        last_name: "Rudd",
        annual_salary: 60050,
        super_rate: 0.09,
        pay_period: "01 March - 31 March"
      )
    end

    it "should gross income correct" do
      expect(@employee.annual_salary).to_not be_nil
      expect(@employee.gross_income).to eq((@employee.annual_salary / 12).round)
    end

    it "should income tax correct" do
      expect(@employee.income_tax).to eq(922)
    end

    it "should net income correct" do
      expect(@employee.net_income).to eq(@employee.gross_income - @employee.income_tax)
    end

    it "should super rate correct" do
      expect(@employee.super_res).to eq((@employee.gross_income * @employee.super_rate).round)
    end
  end
end
