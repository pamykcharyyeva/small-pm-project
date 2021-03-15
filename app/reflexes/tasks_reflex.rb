# frozen_string_literal: true

class TasksReflex < ApplicationReflex
 

    def sort
      tasks = JSON.parse(element.dataset.tasks)
      tasks.each do |task|
         # lookup each tasks by string id 
        task_record = Task.find(task['id'])
        # update the position 
        task_record.update(position: task['position'])
      end
    end
  
  

end
