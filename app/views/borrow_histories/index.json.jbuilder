# frozen_string_literal: true

json.array! @borrow_histories, partial: 'borrow_histories/borrow_history', as: :borrow_history
