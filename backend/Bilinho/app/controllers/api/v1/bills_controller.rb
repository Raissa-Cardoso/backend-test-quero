module Api
  module V1
    class BillsController < ApplicationController
      before_action :set_bill, only: %i[ show update destroy ]

      # GET /bills
      def index
        @bills = Bill.all

        render json: @bills
      end

      # GET /bills/1
      def show
        render json: @bill
      end 

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_bill
          @bill = Bill.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def bill_params
          params.require(:bill).permit(:amount, :due_date, :status, :enrollment_id)
        end
    end
  end
end  