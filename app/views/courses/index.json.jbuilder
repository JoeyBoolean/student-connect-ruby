json.array!(@courses) do |course|
  json.extract! course, :id, :crn, :name, :meeting_time
  json.url course_url(course, format: :json)
end
