class IssuesController < ApplicationController
  def index
    @issues_active = Issue.active.all
    @issues_inactive = Issue.inactive.all
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
