module Available
  extend ActiveSupport::Concern

  VALID_STATUSES = ['available', 'unavailable']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # def archived?
  #   status == 'archived'
  # end
end
