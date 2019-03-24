# frozen_string_literal: true

class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_action :find_category, only: %i[edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, flash: { success: create_flash_message('success', 'create', @category, :name) }
    else
      render :index
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, flash: { success: create_flash_message('success', 'update', @category, :name) }
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_categories_path, flash: { success: create_flash_message('success', 'destroy', @category, :name) } if @category.destroy
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
