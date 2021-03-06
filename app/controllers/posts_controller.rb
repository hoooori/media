# frozen_string_literal: true

class PostsController < ApplicationController
  before_action lambda {
    find_post
    provide_categories
  }, only: :show

  def show
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
