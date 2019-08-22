class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']#, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def new
  end

  def create
  end
end
