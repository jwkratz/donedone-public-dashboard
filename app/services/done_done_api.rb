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

end