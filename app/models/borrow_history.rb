class BorrowHistory < ApplicationRecord
  belongs_to :book
  belongs_to :user

  def fine
    # Calculate number of days over-duoverdue_rate , multiply by overdue_rate
    overdue_rate = 1
    overdue_rate * (( due_date - starts_at_time_of_day ) / 1.days).to_i-10
  end
end
