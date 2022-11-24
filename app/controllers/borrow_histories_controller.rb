# frozen_string_literal: true

class BorrowHistoriesController < ApplicationController
  before_action :set_borrow_history, only: %i[show edit update destroy]

  # GET /borrow_histories or /borrow_histories.json
  def index
    # debugger
    user  = User.find_by(id: params[:format])
    if params[:format].present?
      @borrow_histories = user.borrow_histories
    else
      @borrow_histories = current_user.borrow_histories
    end
  end

  # GET /borrow_histories/1 or /borrow_histories/1.json
  def show; end

  # GET /borrow_histories/new
  def new
    @borrow_history = BorrowHistory.new
  end

  # GET /borrow_histories/1/edit
  def edit; end

  # POST /borrow_histories or /borrow_histories.json
  def create
    @borrow_history = BorrowHistory.new(borrow_history_params)

    respond_to do |format|
      if @borrow_history.save

        user_email = @borrow_history.user
        WelcomeMailer.send_greetings_notification(user_email).deliver_now
        format.html { redirect_to borrow_histories_url, notice: 'Borrow history was successfully created.' }
        format.json { render :show, status: :created, location: @borrow_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @borrow_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrow_histories/1 or /borrow_histories/1.json
  def update
    respond_to do |format|
      if @borrow_history.update(borrow_history_params)
        format.html do
          redirect_to borrow_history_url(@borrow_history), notice: 'Borrow history was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @borrow_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borrow_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrow_histories/1 or /borrow_histories/1.json
  def destroy
    @borrow_history.destroy

    respond_to do |format|
      format.html { redirect_to borrow_histories_url, notice: 'Borrow history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_borrow_history
    @borrow_history = BorrowHistory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def borrow_history_params
    params.fetch(:borrow_history).permit(:book_id, :user_id, :book_title, :publish_date, :starts_at_time_of_day,
                                         :due_date, :fine ,:username, :status )
  end
end
