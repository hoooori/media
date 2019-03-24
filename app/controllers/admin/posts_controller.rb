# frozen_string_literal: true

class Admin::PostsController < ApplicationController
  layout 'admin'

  before_action :find_post, only: %i[edit update destroy]
  before_action :authenticate_admin_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_path, flash: { success: create_flash_message('success', 'create', @post, :title) }
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, flash: { success: create_flash_message('success', 'update', @post, :title) }
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_posts_path, flash: { success: create_flash_message('success', 'destroy', @post, :title) } if @post.destroy
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:category_id, :title, :content, :eyecatch, :published)
  end
end
