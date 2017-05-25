require 'rails_helper'

RSpec.describe Employee, type: :model do
  before :each do
    file = File.new(Rails.root.join("spec/fixtures/files/test.csv"))
    @file = ActionDispatch::Http::UploadedFile.new(
    :tempfile => file,
    :filename => File.basename(file)
    )
  end

  context "calculation rate" do
    before :each do 
      Employee.import(@file)
    end

    it "should gross income correct" do
      employee = Employee.find_by(first_name: "David", last_name: "Rudd")
      expect(employee.annual_salary).to_not be_nil
      expect(employee.gross_income).to eq((employee.annual_salary / 12).round)
    end
  end
end
