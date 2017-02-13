require 'sinatra'
require_relative 'class_isbn.rb'

get '/' do
	#'New line of text'
	erb :ISBN_input, :locals => {:isbn_num => '', :results => '', :message1 => '', :message2 => ''}
end

post '/ISBN_num' do
	isbn_num = params[:isbn_input]
	results = check_valid_isbn?(isbn_num)
	#"#{isbn_num} is --> #{results}"
	erb :ISBN_input, :locals => {:isbn_num => isbn_num, :results => results, :message1 => ' is a ', :message2 => ' ISBN'}
end