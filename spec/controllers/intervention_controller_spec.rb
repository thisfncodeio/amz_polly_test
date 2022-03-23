require 'rails_helper'
require 'spec_helper'

describe InterventionsController, :type => :controller do

    describe "interventions#crnew" do
        context "with valid attributes" do
            it "redirects to the Intervention Forms when using interventions#new action" do
                get :new
                expect(response).to render_template :new
              end
        end
    end
end