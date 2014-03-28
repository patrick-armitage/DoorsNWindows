require 'spec_helper'

describe Lead do

  before do
    @lead = Lead.new(name: "John Customer", phone: "1234567890",
                     email: "john@customer.com", zip: "90001",
                     interest: "Both", status: "New Lead")
  end

  subject { @lead }

  it { should respond_to(:name) }
  it { should respond_to(:phone) }
  it { should respond_to(:email) }
  it { should respond_to(:zip) }
  it { should respond_to(:interest) }
  it { should respond_to(:status) }

end
