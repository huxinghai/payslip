require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  before :each do
    file = File.new(Rails.root.join("spec/fixtures/files/test.csv"))
    @file = ActionDispatch::Http::UploadedFile.new(
    :tempfile => file,
    :filename => File.basename(file)
    )
  end

  describe "#index" do
    before :each do 
      Employee.import(@file)
    end

    it "should get then pay period data" do 
      get :index
      expect(response).to be_success
      expect(assigns(:pay_periods).count).to eq(1)
    end

    it "should get then employee data" do 
      get :index, {pay_period: Employee.first.pay_period}
      expect(response).to be_success
      expect(assigns(:employees).count).to eq(2)
    end

    it "should get then employee blank data" do 
      get :index
      expect(response).to be_success
      expect(assigns(:employees).count).to eq(0)
    end
  end

  describe "#create" do
  
    it "should render new template" do 
      post :create, nil
      expect(response).to render_template(:new)
    end

    it "The file exception should be thrown message" do
      post :create, nil
      expect(flash[:error]).to be_present
    end

    it "should be created after redirect_to" do
      post :create, {employee: {file: @file}}
      expect(response).to redirect_to(employees_path)
    end

    it "should be created to complete" do
      expect{
        post :create, {employee: {file: @file}}
      }.to change(Employee,:count).by(2)
    end
  end  
end
