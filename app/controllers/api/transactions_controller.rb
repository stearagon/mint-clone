class Api::TransactionsController < ApplicationController
  before_action :require_log_in

  def index
    @transactions = current_user.transactions #.find_by_account_id(params[:id])
    render :index
  end

  def create
    @transaction = Transaction.new(transaction_params)


    if @transaction.save
      render json: @transaction
    else
      render json: @transaction.errors.full_messages, status: :unprocessable_entity;
    end
  end

  def show
    @transaction = Transaction.find(params[:id])

    if @transaction
      render :show
    else
      render json: @transaction.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:account_id, :amount, :transaction_type,
                                        :description, :category, :transaction_date, :notes)
  end
end
