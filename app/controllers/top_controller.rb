# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @categories = Category.all
    @posts = Post.where(published: true).order(created_at: :desc)
  end
end
