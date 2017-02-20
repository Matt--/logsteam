class NotesController < ApplicationController
	before_action :find_note, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate, except: [ :index, :show ]

	#this is for checking if the note is older than 3 days and is related to the private method check_time! in the notes controller
	before_filter :check_time!, only: [:edit, :update]
	
	def index
		@notes = Note.where(user_id: current_user)
		respond_to do |format|
			format.html
			format.pdf do
				pdf = Prawn::Document.new
				@notes.each do |note|
					pdf.text "#{note.created_at} \n Title: #{note.title}  \n Content: #{note.content} \n \n"
				end
				send_data pdf.render, filename: "MyNotes.pdf", type: "application/pdf"
			end
		end
	end

	def start_time

	end


	def show
		respond_to do |format|
			format.html
			format.pdf do
				pdf = NotePdf.new(@note)
				send_data pdf.render, filename: "note_#{@note.id}.pdf", type: "application/pdf"
			end
		end

	end

	def new
		@note = current_user.notes.build
	end

	def create
		@note = current_user.notes.build(note_params)

		if @note.save
			redirect_to @note
		else
			render 'new'
		end
	end

	def edit
	end


	def update
		if @note.update(note_params)
			redirect_to @note
		else
			render 'edit'
		end
	end

	def calendar
		@notes = Note.all
	end

	def profile

	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end

	private

	def find_note
		@note = Note.find(params[:id])
	end

	def note_params
		params.require(:note).permit(:title, :content)
	end

	def authenticate
		authenticate_user! && current_user.admin?
	end



	#for checking if the note is older than 3 days
  def check_time!
      if Time.now > @note.created_at + 3.days && current_user.admin == false
      redirect_to '/notes/editalert'
      end
    end
end
