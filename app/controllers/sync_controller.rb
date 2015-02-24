class SyncController < ApplicationController
  def index
    Project.sync_from_api
    Issue.sync_from_api

    redirect_to root_url
  end
end
