class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user

  # method for colors for not-started, in progress, completed
  def badge_color
    case status
    when 'not-started'
      'secondary'
    when 'in-progress'
      'info'
    when 'complete'
      'success'
    end
  end

  # method for progress percentage
  # if none of tasks started = show "not-started"
  # if anything in progress and completed= show "in-progress"
  # if everything is finished = completed

  def status
    # if non of tasks started, then return not started
    return 'not-started' if tasks.none?
    # if all complete then say 'complete'
    if tasks.all? { |task| task.complete? }
      'complete'
      # in progress if anything in progress or complete
    elsif tasks.any? { |task| task.in_progress? || task.complete? }
      'in-progress'
    else
      'not-started'
    end
  end

  #  method for percent complete
# take total completed tasks to a float and devide by tasks and multiply by 100 and round that up
  def percent_complete
    # return 0 if there is no tasks
    return 0 if tasks.none?
    ((total_complete.to_f / total_tasks) * 100).round
  end


# method to count all completed tasks
# by selecting all tasks that were completed and count them
  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  # method to count all tasks
  def total_tasks
    tasks.count
  end

end

