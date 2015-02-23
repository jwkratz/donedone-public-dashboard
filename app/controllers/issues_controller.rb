class IssuesController < ApplicationController
  def index
    @issues_active = Issue.active
    @issues_inactive = Issue.inactive
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
