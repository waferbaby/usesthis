require 'digest/sha1'

class String
        def to_slug
                require 'iconv'
                Iconv.conv('ASCII//TRANSLIT//IGNORE', 'UTF8', self).gsub(/[^a-zA-Z ]/, '').gsub(/[ ']/, '.').downcase
        end
	
	def to_sha1
		Digest::SHA1.hexdigest(self)
	end
end