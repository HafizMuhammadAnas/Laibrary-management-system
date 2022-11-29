class BorrowedBooksController < ApplicationController
  def index
    user  = User.find_by(id: params[:format])
    if params[:format].present?
      @borrow_histories = user.borrow_histories
    else
      @borrow_histories = current_user.borrow_histories
    end
  end
  private
  def set_borrow_history

    @borrow_history = BorrowHistory.find(params[:id])
  end

  def borrow_history_params
    params.fetch(:borrow_history).permit(:book_id, :user_id, :book_title, :publish_date, :starts_at_time_of_day,
                                         :due_date, :fine ,:username, :status )
  end
end
