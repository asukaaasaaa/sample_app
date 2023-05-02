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
    redirect_to'/top'
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
