#user team app.rb file

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

set :database, { adapter: "sqlite3", database: "mydb.db" }

require './models/user'
require './models/team'

get "/" do
    erb :info_page
end

get "/user" do
    @users = User.all
    erb :user_form
end

get "/user/:id" do
    @user = User.find_by(id: params[:id])
    if @user.nil?
        return "User not found"
    end
    erb :user
end   
    
get "/team" do
    @teams = Team.all
    erb :team_form
end

get "/team/:id" do
    @team = Team.find_by(id: params[:id])
    if @team.nil?
        return "Team not found"
    end
    erb :team
end   




    


