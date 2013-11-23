class StaticPagesController < ApplicationController
  def home
    @lead = Lead.new
  end


  def about
  end
end
