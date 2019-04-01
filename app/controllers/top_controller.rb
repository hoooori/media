# frozen_string_literal: true

class TopController < ApplicationController
  before_action :provide_categories

  def index
    @categories = Category.all
    @posts = Post.includes(:category).where(published: true).order(created_at: :desc).page(params[:page]).per(5)
  end
end
