# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @pagy, @articles = pagy Article.all.order(id: :desc)
  end
end
