class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    comment = @book.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.user_id = current_user.id
    comment.save
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book = @book_comment.book
    @book_comment.destroy
  end

private
 def book_comment_params
   params.require(:book_comment).permit(:comment)
 end
end
