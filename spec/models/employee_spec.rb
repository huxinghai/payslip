require 'rails_helper'

RSpec.describe Employee, type: :model do

  before :each do 
    @employee = Employee.create(
      first_name: "David", 
      last_name: "Rudd",
      annual_salary: 60050,
      super_rate: 0.09,
      pay_period: "01 March - 31 March"
    )
  end

  context "validates" do 
    it "with valid attributes" do 
      expect(@employee).to be_valid
    end

    it "without a name" do 
      @employee.first_name = nil
      expect(@employee).to_not be_valid
      @employee.first_name = "David"
      @employee.last_name = nil
      expect(@employee).to_not be_valid
    end

    it "without a annual_salary" do 
      @employee.annual_salary = nil
      expect(@employee).to_not be_valid
    end

    it "without a super_rate" do 
      @employee.annual_salary = nil
      expect(@employee).to_not be_valid
    end

    it "without a pay_period" do 
      @employee.pay_period = nil
      expect(@employee).to_not be_valid
    end

    it "annual_salary is numericality" do
      @employee.annual_salary = "a"
      expect(@employee).to_not be_valid 
      @employee.annual_salary = 12000
      expect(@employee).to be_valid 
    end
  end

  context "calculation rate" do
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
