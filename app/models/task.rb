class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ['not-started', 'in-progress', 'complete'] }

  # define const with argument that front end will take 
  STATUS_OPTIONS = [
    ['Not Started', 'not-started'],
    ['In Progress', 'in-progress'],
    ['Complete', 'complete']
  ]

  # # method for colors for not-started, in progress, completed
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

      def readable_status
        case status
        when 'not-started'
          'Not started'
        when 'in-progress'
          'In progress'
        when 'complete'
          'Complete'
        end
      end

      def color_class
        case status
        when 'not-started'
          'secondary'
        when 'in-progress'
          'info'
        when 'complete'
          'success'
        end
      end

      # methods so we can use inside project model(class)
      def complete?
        status == 'complete'
      end


      def in_progress?
        status == 'in-progress'
      end


      def not_started?
        status == 'not-started'
      end
  
end

