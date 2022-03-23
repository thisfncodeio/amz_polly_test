require 'rails_helper'
require 'spec_helper'

describe "interventions/index.html.erb" do
    it "check if the template index displays all the interventions" do
      assign(:interventions, [
        stub_model(Intervention, :report => "slicer"),
        stub_model(Intervention, :report => "dicer")
      ])
  
      render
      
      puts '============================'
      puts rendered
      expect(rendered).to include("slicer")
      expect(rendered).to include("dicer")
     
    end
end