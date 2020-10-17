json.array!(@schedules) do |s|
    json.extract! s, :id, :title, :body
    json.start s.start
    json.end s.end
    json.url event_url(s, format: :html)
end