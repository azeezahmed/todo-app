require 'rails_helper'

RSpec.describe Todo, type: :model do

  context "validations" do
    it {should validate_presence_of(:title)}
  end

  context "todo state" do
    it { should define_enum_for(:status).with([:pending, :completed]) }
  end
end
