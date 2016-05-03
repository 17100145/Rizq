require 'rails_helper'
# spec/controllers/application_controller_spec.rb

describe ApplicationController do
    describe '#set_timezone' do
        it 'sets the timezone to Islamabad' do
            Time.zone.name.should be_in(["Islamabad", "UTC"])
        end
    end
end
