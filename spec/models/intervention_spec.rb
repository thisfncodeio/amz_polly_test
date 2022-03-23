require 'rails_helper'

RSpec.describe Intervention, :type => :model do
  describe "Associations" do
    it "belongs_to Building" do
        assc = Intervention.reflect_on_association(:building)
        expect(assc.macro).to eq :belongs_to
      end
  end
end