class IssuesController < ApplicationController
  def index
    @issues_active = Issue.active.order(last_updated_on: :desc)
    @issues_inactive = Issue.inactive.order(last_updated_on: :desc)
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
