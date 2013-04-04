class AboutController < ApplicationController
  def show
    render params[:id]
  end
end
