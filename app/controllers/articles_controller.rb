class ArticlesController < ApplicationController
require 'open-uri'
require 'nokogiri'

  def index
  	@articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def create
  	url = 'http://www.yahoo.co.jp/'
  	charset = nil
  	html = open(url) do |f|
	  	charset = f.charset #文字種別を取得
	  	f.read #htmlを読み込んで変数htmlに渡す
  	end

  	doc = Nokogiri::HTML.parse(html, nil, charset)
  	Article.create(content: doc)
  	redirect_to articles_path
  end

end
