module Api
	module V1
		class StudentsController < ApplicationController
			# GET /students
			def index        
				students = Student.order('created_at ASC'); 				            
				if !params["count"] || !params["page"] 
					render json: students,status: :ok
				else
					studentsCount=[]
					count=0
					while count<params["count"]  do 
						studentsCount.push({
							id:students[count].id, 
							name:students[count].name, 
							cpf:students[count].cpf,
							birthdate:students[count].birthdate, 
							payment_method:students[count].payment_method
						})
						count+=1
					end    
       
					render json: {page: params["page"], items:studentsCount},status: :ok
				end		
			end
			# GET /students/1
			def show
				student = Student.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded student', data:student},status: :ok
			end
			# POST /students
			def create
				student = Student.new(student_params)
				if student.save
					render json: {id:student.id},status: :ok
				else
					render json: {status: 'ERROR', message:'students not saved', data:student.erros},status: :unprocessable_entity
				end
			end
			# DELETE /students/1
			def destroy
				student = Student.find(params[:id])
				student.destroy
				render json: {status: 'SUCCESS', message:'Deleted student', data:student},status: :ok
			end
			# PATCH/PUT /students/1
			def update
				student = Student.find(params[:id])
				if student.update(student_params)
					render json: {status: 'SUCCESS', message:'Updated student', data:student},status: :ok
				else
					render json: {status: 'ERROR', message:'students not update', data:student.erros},status: :unprocessable_entity
				end
			end
			# Only allow a list of trusted parameters through.
			private
			def student_params
				params.permit(:name, :cpf, :birthdate, :payment_method)
			end
		end
	end
end