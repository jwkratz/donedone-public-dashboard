class SyncController < ApplicationController
  def index
    Project.sync_from_api
  end
end
