# frozen_string_literal: true

# Controller for FAQ admin route
class FaqsController < ApplicationController
  load_and_authorize_resource
  before_action :set_faq, only: [:show, :edit, :update, :destroy]

  def initialize
    super
    @pgheader = 'Faqs'
    @breadcrumb = 'Faqs'
  end

  def index
    @faqs = Faq.all
  end

  def show; end

  def new
    @faq = Faq.new
  end

  def edit; end

  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html do
          redirect_to @faq, notice: 'Faq was successfully created.'
        end
        format.json { render :show, status: :created, location: @faq }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html do
          redirect_to @faq, notice: 'Faq was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @faq.destroy
    respond_to do |format|
      format.html do
        redirect_to faqs_url, notice: 'Faq was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_faq
    @faq = Faq.find(params[:id])
  end

  def faq_params
    params.require(:faq).permit(:title, :answer, :is_active)
  end
end
