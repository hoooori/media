# frozen_string_literal: true

class Admin::PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to admin_posts_path
    else
      redirect_to admin_posts_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :eyecatch, :published)
  end
end
