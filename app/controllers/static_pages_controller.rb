class StaticPagesController < ApplicationController
  def home
    @lead = Lead.new
  end

  def redirect_thank_you
    render 'static_pages/redirects/thank_you'
  end

  def redirect_no_service
    render 'static_pages/redirects/no_service'
  end

  def about_story
    render 'static_pages/about_us/about'
  end

  def about_services
    render 'static_pages/about_us/services'
  end

  def about_guarantee
    render 'static_pages/about_us/guarantee'
  end

  def products_windows
    render 'static_pages/products/windows'
  end

  def products_doors
    render 'static_pages/products/doors'
  end

  def products_hardware
    render 'static_pages/products/hardware'
  end

  def mfg_choose
    render 'static_pages/mfgs/choose'
  end

  def info_how
    render 'static_pages/info/how'
  end

  def info_faqs
    render 'static_pages/info/faqs'
  end

  def info_installs
    render 'static_pages/info/installs'
  end

  def info_mfgs
    render 'static_pages/info/mfgs'
  end

  def info_historic
    render 'static_pages/info/historic'
  end

  def contact_email
    @inquiry = Inquiry.new
    render 'static_pages/contact/email_us'
  end

  def contact_info
    render 'static_pages/contact/info'
  end
end
