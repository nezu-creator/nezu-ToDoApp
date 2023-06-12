class TasksController < ApplicationController
  before_action :set_task, only: [:show]

  def index
    @board = Board.find(params[:board_id])  # リクエストパラメータからboard_idを取得し、@boardを設定する
    @tasks = @board.tasks  # @boardに関連するタスクを取得し、@tasksに代入する
  end

  def show
    @tasks = @board.tasks
  end

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build
  end

  def create
    @board = Board.find(params[:board_id])  # リクエストパラメータからboard_idを取得し、@boardを設定する
    @task = @board.tasks.build(task_params)  # @boardに関連するタスクをビルドする
    @task.user = current_user # ユーザーにタスクを関連付ける
    if @task.save
      redirect_to board_tasks_path(@board), notice: '保存できました'  # リダイレクト先のパスには@boardを渡す
    else
      flash.now[:error] = '保存できませんでした'
      puts @task.errors.full_messages  # エラーメッセージをコンソールに出力
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(@task), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to root_path, notice: '削除成功しました'
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end