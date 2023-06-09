class Commentscontrolller < ApplicationController
  def new
    task = Task.find(paramus[:tasks_id])
    @comment = task.comments.build
  end
end