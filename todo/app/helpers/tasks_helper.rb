module TasksHelper
  def line_color(task)
    (task.late?) ? "red" : "black"
  end
end
