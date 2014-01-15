class StaticPagesController < ApplicationController
  def home
    @lead = Lead.new
  end

  def about
  end

  def contact
    @inquiry = Inquiry.new
  end
end
