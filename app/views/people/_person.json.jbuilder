json.extract! person, :id, :firstname, :middlename, :lastname, :nickname, :birthday, :birthmonth, :birthyear, :note, :created_at, :updated_at
json.url person_url(person, format: :json)
