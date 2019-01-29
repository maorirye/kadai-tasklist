class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.order('created_at DESC').page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # Userがきちんと作成された場合、トップページにリダイレクトする
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      # validationなど、何らかの理由でUserの作成に失敗した場合、もう一度User作成画面を表示する
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
