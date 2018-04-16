class IndexController < ApplicationController

  # EXTERNAL_APIS = %w(ID LOCATIONS_API MENA MESSENGER NOTIFY PERMISSIONS_API ROOMS SPACEMAN).freeze
  EXTERNAL_APIS = %w(ROOMS LOCATIONS_API NOTIFY MESSENGER ID).freeze

  def index
    @checks = Hash[
        EXTERNAL_APIS.map do |name|
          details = APIConnection.get_health(name)
          if details == "failed"
            [name, { "status" => "fail", details => {} } ]
          else
            [name, APIConnection.get_health(name)]
          end
        end
      ]
  end
end
