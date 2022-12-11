module Api
	module V1
		class EnrollmentsController < ApplicationController
			# GET /enrollments
			def index        
				enrollments = Enrollment.order('created_at ASC'); 				             
				enrollmentCount = []
				count=0
				while count<params["count"] do 
					bills=Bill.where(enrollment_id:enrollments[count].id)
					enrollmentCount.push({
						id:enrollments[count].id,
						student_id:enrollments[count].student_id,
						amount:enrollments[count].amount,
						installments:enrollments[count].installments,
						due_day:enrollments[count].due_day,
						bills:bills
					})          
					count+=1
				end  
				render json: {page: params["page"], items:enrollmentCount},status: :ok
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
					#CreateBillsService.call(enrollment) 			  
         			bills=Bill.where(enrollment_id:enrollment.id)
					render json: {id:enrollment.id,student_id:enrollment.student_id, amount:enrollment.amount,
                        installments:enrollment.installments, due_day:enrollment.due_day,
                        bills:bills}, status: :ok
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
				if enrollment.update_attributes(enrollment_params)
					render json: {status: 'SUCCESS', message:'Updated enrollment', data:enrollment},status: :ok
				else
					render json: {status: 'ERROR', message:'enrollments not update', data:enrollment.erros},status: :unprocessable_entity
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