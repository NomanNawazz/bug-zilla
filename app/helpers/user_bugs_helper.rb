# frozen_string_literal: true

# User Bugs Helper
module UserBugsHelper
  def change_status(bug)
    case bug.status
    when 'New'
      'started'
    when 'started'
      bug.bug_type.eql?('bug') ? 'resolved' : 'completed'
    end
  end
end
