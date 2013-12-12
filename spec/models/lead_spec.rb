require 'spec_helper'

describe Lead do

  before do
    @lead = Lead.new(name: "John Customer", phone: "1234567890",
                     email: "john@customer.com", zip: "12345", interest: "Both")
  end

  subject { @lead }

  it { should respond_to(:name) }
  it { should respond_to(:phone) }
  it { should respond_to(:email) }
  it { should respond_to(:zip) }
  it { should respond_to(:interest) }

end
