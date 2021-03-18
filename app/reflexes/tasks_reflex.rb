# frozen_string_literal: true

class TasksReflex < ApplicationReflex
 

    def sort
      # take element.dateset.tasks parse to json to be able to work with it 
      tasks = JSON.parse(element.dataset.tasks)
      # lookup each tasks
      tasks.each do |task|
         # find task by string id
        task_record = Task.find(task['id'])
        # update the position 
        task_record.update(position: task['position'])
      end
    end
  
  

end
