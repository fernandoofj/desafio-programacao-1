module Parser
	class StreamParser
		def initialize(stream, separator = /\t+/, skip_header = true)
			@lines = stream.readlines
			@lines.shift if skip_header
			@separator = separator
		end

		def parse
			@lines.each { |line|
				yield line.split(@separator)
			}
		end
	end
end