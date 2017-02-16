class NotesController < ApplicationController
	before_action :find_note, only: [:show, :edit, :update, :destroy]

	def index
		@notes = Note.where(user_id: current_user)
<<<<<<< HEAD
		respond_to do |format|
			format.html
			format.pdf do
				pdf = Prawn::Document.new
				@notes.each do |note|
					pdf.text "#{note.title} \n #{note.content} \n \n"
				end
				send_data pdf.render, filename: "MyNotes.pdf", type: "application/pdf"
			end
		end
	end

	def show
		respond_to do |format|
			format.html
			format.pdf do
				pdf = NotePdf.new(@note)
				send_data pdf.render, filename: "note_#{@note.id}.pdf", type: "application/pdf"
			end
		end
=======

	end

	def show
		
>>>>>>> 7898df81f1a49fa465585011b443615035f00978
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

end
