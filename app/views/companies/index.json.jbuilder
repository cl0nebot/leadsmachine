json.array!(@companies) do |company|
  json.extract! company, :id, :user_id, :cname, :street1, :street2, :city, :province_id, :postalcode, :phone, :googleplus, :facebook, :linkedin, :twitter, :shortdescription, :longdescription, :tags, :citationemail, :businessemail, :login, :password, :timezone
  json.url company_url(company, format: :json)
end
