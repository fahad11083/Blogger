class ComentsController < ApplicationController
    def create
        @comment = Coment.new(comment_params)
        @comment.article_id = params[:article_id]
        @comment.save
      
        redirect_to article_path(@comment.article)
      end
      def comment_params
        params.require(:coment).permit(:author_name, :body)


      end


end

