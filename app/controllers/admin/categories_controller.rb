class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']#, except: [:index, :show]

  def index
    @categories = Category.all
    # @categories.each do |c|
    #   puts "Cat name: #{c.name}"
    # end
  end

  def new
  end

  def create
  end
end
