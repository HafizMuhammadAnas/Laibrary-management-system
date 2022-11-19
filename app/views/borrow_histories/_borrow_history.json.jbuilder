# frozen_string_literal: true

json.extract! borrow_history, :id, :created_at, :updated_at
json.url borrow_history_url(borrow_history, format: :json)
