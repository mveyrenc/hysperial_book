# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]

  respond_to :html

  def index
    @tests = Test.all
    respond_with(@tests)
  end

  def show
    respond_with(@test)
  end

  def new
    @test = Test.new
    respond_with(@test)
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    flash[:notice] = 'Test was successfully created.' if @test.save
    respond_with(@test)
  end

  def update
    flash[:notice] = 'Test was successfully updated.' if @test.update(test_params)
    respond_with(@test)
  end

  def destroy
    @test.destroy
    respond_with(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params[:test]
  end
end
