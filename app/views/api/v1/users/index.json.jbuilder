json.array! @users do |user|
  json.(user, :id, :email, :created_at, :updated_at)

end

