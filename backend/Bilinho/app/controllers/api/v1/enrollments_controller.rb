module Api
	module V1
		class EnrollmentsController < ApplicationController			
			
			# GET /enrollments
			def index 
				enrollments=Enrollment.order('created_at ASC')
				if !params["count"] || !params["page"] 
					render json: enrollments,status: :ok
				else
					result = ViewerEnrollments.new({count:params["count"], page:params["page"]}).charge	             
					render json: {page: params["page"], items:result},status: :ok
				end
			end
			# GET /enrollments/1
			def show
				enrollment = Enrollment.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded enrollment', data:enrollment},status: :ok
			end
			# POST /enrollments
			def create
				enrollment = Enrollment.new(enrollment_params) 								           
				if enrollment.save 
					result = CreateBills.new({enrollment_id:enrollment.id}).charge
					if result=="success" 	  
						bills=Bill.where(enrollment_id:enrollment.id)
						render json: {id:enrollment.id,student_id:enrollment.student_id, amount:enrollment.amount,
							installments:enrollment.installments, due_day:enrollment.due_day,
							bills:bills}, status: :ok
					end
				else
					render json: {status: 'ERROR', message:'enrollments not saved', data:enrollment.erros},status: :unprocessable_entity
				end
			end
			# DELETE /enrollments/1
			def destroy
				enrollment = Enrollment.find(params[:id])
				enrollment.destroy
				render json: {status: 'SUCCESS', message:'Deleted enrollment', data:enrollment},status: :ok
			end
			# PATCH/PUT /enrollments/1
			def update
				enrollment = Enrollment.find(params[:id])										
					if enrollment.update(enrollment_params)	
						resultUpdate = UpdateBills.new({enrollment_id:enrollment.id}).charge
						if resultUpdate=="success" 														
							results=CreateBills.new({enrollment_id:enrollment.id}).charge										
							if results=="success" 								 
								render json: {status: 'SUCCESS', message:'Updated enrollment', data:enrollment},status: :ok
							else
								render json: {status: 'ERROR', message:'Enrollments not update', data:enrollment.erros},status: :unprocessable_entity
							end	
						else
							render json: {status: 'ERROR', message:'Enrollments not update', data:enrollment.erros},status: :unprocessable_entity
						end							
					end			
			end
			# Only allow a list of trusted parameters through.
			private
			def enrollment_params
				params.permit(:amount, :installments, :due_day, :student_id)
			end
		end
	end
end