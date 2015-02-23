class DoneDoneApi

  def self.conn
    connection = Faraday.new(:url => ENV['DONEDONE_API_BASE_URL'])
    connection.basic_auth(ENV['DONEDONE_API_USERNAME'], ENV['DONEDONE_API_TOKEN'])
    connection
  end

  def self.sync_projects
    response = conn.get '/issuetracker/api/v2/projects.json'
    if response.body
      api_projects = JSON.parse(response.body)
      api_projects.each do |api_project|
        p = Project.find_or_initialize_by(project_id: api_project['id'])
        p.title = api_project['title']
        p.save
      end
    end
  end

  def self.sync_issues
    issues_response = conn.get '/issuetracker/api/v2/issues/all.json'

    if issues_response.body
      api_issues = JSON.parse(issues_response.body)['issues']
      api_issues.each do |api_issue|

        project_id = api_issue['project']['id']
        order_number = api_issue['order_number']

        p = Project.find_by(project_id: project_id)

        issue_response = conn.get "/issuetracker/api/v2/projects/#{project_id}/issues/#{order_number}.json"
        if issue_response.body
          api_issue_detail = JSON.parse(issue_response.body)
          i = Issue.find_or_initialize_by(order_number: api_issue_detail['order_number'])
          i.title = api_issue_detail['title']
          i.project = p
          i.status = api_issue_detail['status']['name']
          i.priority = api_issue_detail['priority']['name']
          i.fixer = api_issue_detail['fixer']['name']
          i.tester = api_issue_detail['tester']['name']
          # i.description = api_issue_detail['description']

          i.save
        end

      end
    end

  end

end