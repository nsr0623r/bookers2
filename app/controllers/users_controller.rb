class UsersController < ApplicationController
  #ユーザー一覧ページ
  def index
    @user = User.all
  end

  #ログイン後ページ（ログインユーザー詳細ページ）
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to user_path(resource)
  end

  #プロフィール変更ページ
  def edit
    #is_matching_login_user
    @user = User.find(user_params)
  end
  
  #プロフィール変更を更新する
  def update
    #is_matching_login_user
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
