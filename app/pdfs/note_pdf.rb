class NotePdf < Prawn::Document
	def initialize
		super
		text "Note goes here"
	end
end 
