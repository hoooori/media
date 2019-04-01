# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :find_category, only: :show
  before_action :provide_categories

  def show
    @posts = @category.posts.where(published: true).order(created_at: :desc).page(params[:page]).per(3)
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end
end
