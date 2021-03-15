# frozen_string_literal: true

class StatusReflex < ApplicationReflex
  # to lookup the task and do some stuff
  # and update that task with new status
  # we have access to elemement.data with simple id
  # update with with new status
  def change
    task = Task.find(element.dataset[:id])
    task.update(status: element.dataset[:status])
  end


end
