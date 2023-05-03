class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数にからのオブジェクトを生成
    @list = List.new
  end

  def create
    # データを受け取って新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをデータベースに保存
    list.save
    # top画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
