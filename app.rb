require 'forgery'
Mongoid.load! "./mongoid.yml"

class User
  include Mongoid::Document
  field :name, type: String, default: ->{Forgery(:name).full_name}
  field :age, type: Integer, default: ->{rand(100)}
  field :email, type: String, default: ->{Forgery(:internet).email_address}
end

class UserAPI < Grape::API
  format :json
  resource :user do
    get {User.all.entries}

    params do
      optional :name, type: String
      optional :age, type: Integer
      optional :email, type: String
    end
    post {User.create!(params.slice(:name, :age, :email))}

    route_param :id do
      get {User.find params[:id]}
      put do
        user = User.find params[:id]
        user.update_attributes!(params.slice(:name, :age, :email))
      end
      delete {User.find(params[:id]).destroy}
    end

    delete {User.destroy_all}
  end
end
