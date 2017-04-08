require "sinatra"
require_relative "config/application"
require "pry"

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/projects'
end

get '/projects' do
  @projects = Project.all

  erb :'/projects/index'
end

get '/projects/:id' do
  @project = Project.where(id: params[:id]).first
  @contributors = @project.users
  @tasks = @project.tasks

  erb :'/projects/view'
end
