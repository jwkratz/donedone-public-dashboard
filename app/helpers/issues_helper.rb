module IssuesHelper
  def short_name(name)
    name.sub(/(.+\b.).+\z/, '\1.')
  end
end
