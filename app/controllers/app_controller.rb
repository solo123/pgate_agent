class AppController < ApplicationController
  layout 'agent_layout'
  before_action :authenticate_agent!

end
