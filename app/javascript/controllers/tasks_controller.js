import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for TasksReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {

  sort(event) {
    // console.log("here!")
    // get element represents element we want to send to the reflex
    let element = document.getElementById('tasks-list')
    // get elements by class name (it will return html object)
    let task_elements = document.getElementsByClassName('task-item')
    // but we want Array, once we put that into array and map through and iterate through tasks- include index
    let tasks = Array.from(task_elements).map((task, index) => {
      // return object
      return { id: task.dataset.taskId, position: (index + 1) }
    })
    //  
    element.dataset.tasks = JSON.stringify(tasks)
    // triger stimulate reflex, its look through tasks reflex (inside tasks folder)
    this.stimulate('TasksReflex#sort', element)
  }

}
