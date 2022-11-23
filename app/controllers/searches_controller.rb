class SearchesController < ApplicationController
  def search
   @word = params[:word]
   @model = params[:model]

   if @model == "user"
    @records = User.search(@word)
   else
    @records = PostImage.search(@word)
   end
  end
end
