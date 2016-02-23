require 'rails_helper'

RSpec.describe Api::V1::ControllersHelper, type: :helper do

  def json_response
    JSON.parse(response.body)
  end


end
