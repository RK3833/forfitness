class TopController < ApplicationController
	require 'open-uri'
	require 'nokogiri'
	# require 'robotex'

	# robotex = Robotex.new
	# p robotex.allowed?("http://www.yahoo.co.jp/")

	# get '/index' do
	# url ='http://www.yahoo.co.jp/'

	# user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'


	def index
		url = 'http://matome.naver.jp/tech'

		charset = nil
		html = open(url) do |f|
  			charset = f.charset # 文字種別を取得
  			f.read # htmlを読み込んで変数htmlに渡す
		end

		doc = Nokogiri::HTML.parse(html, nil, charset)

		@news = doc.xpath('//li[@class="mdTopMTMList01Item"]').each do |node|
		  # tilte
			  p node.css('h3').inner_text

			  # 記事のサムネイル画像
			  p node.css('img').attribute('src').value

			  # 記事のサムネイル画像
			  p node.css('a').attribute('href').value
		end
	end
end
