class SearchController < ApplicationController
  def query
    @query_string = params[:q]

    if params[:filter] == 'title'
      results = Book.tire.search do |search|
                search.query { |query| query.string "title:#{@query_string}" }
                search.sort  { by :title }
                search.size 30
      end
    elsif params[:filter] == 'author'
      results = Book.tire.search do |search|
                search.query { |query| query.string "author:#{@query_string}" }
                search.sort  { by :title }
                search.size 30
      end
    else
      results = Book.tire.search do |search|
                search.query { |query| query.string @query_string }
                search.sort  { by :title }
                search.size 30
      end   
    end
    render :json => results
  end
end