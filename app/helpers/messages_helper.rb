module MessagesHelper
	def small_time(time)
		time.gsub(/[\sinutesourayb]/, '')
	end
end
