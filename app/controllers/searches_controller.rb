class SearchesController < ApplicationController
  def search
   @word = params[:word]
   @model = params[:model]

   if @model == "user"
    @records = User.search(@word).page(params[:page]).per(5)
   else
    @records = PostImage.search(@word).page(params[:page]).per(8).order(id: "DESC")
   end
  end
end
