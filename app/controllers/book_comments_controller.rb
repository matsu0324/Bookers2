class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    comment = @book.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.user_id = current_user.id
    comment.save
    # unless comment.save
    #   render 'error'
    # end
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book = @book_comment.book
    @book_comment.destroy
    # @book = Book.find(params[:book_id])
    # book_comment = @book.book_comments.find(params[:id])
    # book_comment.destroy
    # BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
  end


private
 def book_comment_params
   params.require(:book_comment).permit(:comment)
 end
end
