class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  BRAND_NAME = 'Seoplace'.freeze
  BASE_URL = 'https://seoplace.com'.freeze
  
  def meta_title(title)
    [title, BRAND_NAME].reject(&:empty?).join(' | ')
  end
  
  def canonical_url(path = '')
    URI.join(BASE_URL, path)
  end
end
