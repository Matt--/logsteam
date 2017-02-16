class NotePdf < Prawn::Document
	def initialize(note)
		super()
		@note = note
		text "#{@note.title}\n#{@note.content}"
	end
end 
