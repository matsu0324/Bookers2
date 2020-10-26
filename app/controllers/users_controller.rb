class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  # メール送信機能
  def create
    @user = User.new(name: params[:name], email: params[:email],
    password_digest: params[:password])
    if @user.save #ユーザーのインスタンスが新しく生成されて保存されたら
      ThanksMailer.greeting(@user).deliver_now #確認メールを送信
      redirect_to ("/user/#{@user.id}")
    else
      render ('users/new')
    end
  end
  #
  # def create
  #   if @user.save
  #     ThanksMailer.greeting(@user).deliver
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "You have updated user successfully."
    else
      @books = @user.books
      render 'edit'
    end
  end
  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
